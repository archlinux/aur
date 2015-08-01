# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=cloudzec-git
_pkgname=cloudzec
provides=('cloudzec')
pkgver=0.6.3
pkgrel=3
pkgdesc='CloudZec sync (short „cloudzec“) is a free synchronisation solution with end-to-end encryption, based on stable technologies like GnuPG and SFTP'
url='http://cloudzec.org'
conflicts=('cloudzec')
arch=('any')
license=('GPL3')
depends=('python' 'python-paramiko' 'python-gnupg')
optdepends=(
    'python-notify2: Notification support'
    'python-gobject: CloudZec icon for notifications'
    'python-keyring: Keyring integration'
)
makedepends=('git')
source=('git://github.com/KopfKrieg/cloudzec.git')
sha1sums=('SKIP')

pkgver() {
    cd cloudzec/
    echo "0.$(echo "scale=1; $(git log --format='%ci' | wc -l) / 10" | bc)"
}

build() {
  cd "${_pkgname}"
  git checkout master
}

package() {
  cd "${_pkgname}"
  git checkout master
  install -Dm644 libcloudzec.py "${pkgdir}/usr/lib/python3.4/libcloudzec.py"
  install -Dm755 cloudzec "${pkgdir}/usr/bin/cloudzec"
  install -Dm644 icons/cloudzec_16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/cloudzec.png"
  install -Dm644 icons/cloudzec_22.png "${pkgdir}/usr/share/icons/hicolor/22x22/apps/cloudzec.png"
  install -Dm644 icons/cloudzec_24.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/cloudzec.png"
  install -Dm644 icons/cloudzec_32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/cloudzec.png"
  install -Dm644 icons/cloudzec_48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/cloudzec.png"
  install -Dm644 icons/cloudzec_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cloudzec.png"
  install -Dm644 icons/cloudzec_scalable.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cloudzec.svg"
  install -Dm644 cloudzec.desktop "${pkgdir}/usr/share/applications/cloudzec.desktop"
}
