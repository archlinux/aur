# Maintainer: David Runge <dave@sleepmap.de>

_basename=khard
pkgname=khard-git
pkgver=0.11.4.r0.g03f5891
pkgrel=3
pkgdesc="Console CardDAV client"
url="https://github.com/scheibler/khard/"
arch=('any')
license=('GPL3')
depends=('python-configobj' 'python-vobject' 'python-yaml' 'python-atomicwrites')
makedepends=('git' 'python-setuptools')
optdepends=('vdirsyncer: Synchronization of address books with a DAV server.')
provides=('khard')
conflicts=('khard')
source=("git+https://github.com/scheibler/khard.git")
install="${pkgname}.install"
sha512sums=('SKIP')

pkgver() {
  cd "${_basename}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${_basename}"
  python setup.py build
}

package() {
  cd "${_basename}"
  python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
  install -Dm 644 misc/khard/khard.conf.example "${pkgdir}/usr/share/doc/khard/khard.conf.example"
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
