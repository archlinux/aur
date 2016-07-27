# Maintainer: David Runge <dave@sleepmap.de>

pkgname=khard-git
_gitname=khard
pkgver=0.11.0.r0.g593a2a4
pkgrel=1
pkgdesc="Console CardDAV client"
license=("GPL3")
url="https://github.com/scheibler/khard/"
depends=('python-configobj' 'python-vobject' 'python-yaml' 'python-atomicwrites')
makedepends=('git')
optdepends=('vdirsyncer: Synchronization of address books with a DAV server.'
  'python2-caldavclientlibrary-svn: Create and remove address books on the DAV server using davcontroller utility.')
source=("${_gitname}::git+https://github.com/scheibler/khard.git")
md5sums=('SKIP')
install="${pkgname}.install"
provides=('khard' 'davcontroller')
conflicts=('khard')
arch=('any')
options=(!emptydirs)

pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/${_gitname}"
}

package() {
  cd "$srcdir/${_gitname}/"
  python setup.py install --root=$pkgdir
  install -Dm 644 misc/khard/khard.conf.example "${pkgdir}/usr/share/doc/khard/khard.conf.example"
  install -Dm 755 misc/davcontroller/davcontroller.py "${pkgdir}/usr/bin/davcontroller.py"
  install -Dm 644 misc/khard/template_for_contact_creation.yaml "${pkgdir}/usr/share/doc/khard/template_for_contact_creation.yaml"
  install -Dm 755 misc/sdiff/sdiff_khard_wrapper.sh "${pkgdir}/usr/bin/sdiff_khard_wrapper.sh"
  install -Dm 644 misc/twinkle/scripts/config.py "${pkgdir}/usr/share/khard/twinkle/scripts/config.py"
  install -Dm 644 misc/twinkle/scripts/incoming_call.py "${pkgdir}/usr/share/khard/twinkle/scripts/incoming_call.py"
  install -Dm 644 misc/twinkle/scripts/incoming_call_ended.py "${pkgdir}/usr/share/khard/twinkle/scripts/incoming_call_ended.py"
  install -Dm 644 misc/twinkle/scripts/incoming_call_failed.py "${pkgdir}/usr/share/khard/twinkle/scripts/incoming_call_failed.py"
  install -Dm 644 misc/twinkle/sounds/incoming_call.wav "${pkgdir}/usr/share/khard/twinkle/sounds/incoming_call.wav"
  install -Dm 644 misc/twinkle/sounds/outgoing_call.wav "${pkgdir}/usr/share/khard/twinkle/sounds/outgoing_call.wav"
  install -Dm 644 misc/twinkle/sounds/ringtone_segment.wav "${pkgdir}/usr/share/khard/twinkle/sounds/ringtone_segment.wav"
  install -Dm 644 misc/zsh/_khard "${pkgdir}/usr/share/zsh/site-functions/_khard"
  install -Dm 644 AUTHORS "${pkgdir}/usr/share/doc/khard/AUTHORS"
  install -Dm 644 CHANGES "${pkgdir}/usr/share/doc/khard/CHANGES"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/khard/README.md"
}
