# Maintainer: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: boosterdev@linuxmail.org

pkgname=xdman
pkgver=2018.7.2.8
pkgrel=1
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('i686' 'x86_64')
url="http://xdman.sourceforge.net/"
depends=('java-runtime')
makedepends=('p7zip')
license=('GPL')
source=('xdman.bin')
source_i686=('https://sourceforge.net/projects/xdman/files/xdm-2018-x86.tar.xz')
source_x86_64=('https://sourceforge.net/projects/xdman/files/xdm-2018-x64.tar.xz')
sha256sums=('befc67049b2c2771c51e7c78b9518550c9a0be00f5f687440402927a22660b35')
sha256sums_i686=('d38527850dce9aca8491d33d94e67fbe572c2e8b863eecac3691d8097f0d2ce0')
sha256sums_x86_64=('8ec152751c1b5d5cc06b793970fb6398f7c8e876b1badfc55e28658f45d692ed')

prepare () {
  cd $srcdir
  7z x install.sh -oxdman
  rm -rf xdman/jre
}

package() {
  install -d -m755 "$pkgdir"/opt/xdman
  install -D -m644 "$srcdir"/xdman/xdman.desktop "$pkgdir"/usr/share/applications/xdman.desktop
  cp -dr --no-preserve='ownership' xdman "$pkgdir"/opt/
  install -D -m755 "$srcdir"/xdman.bin "$pkgdir"/opt/xdman/xdman

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/xdman/xdman" "$pkgdir/usr/bin/xdman"
}
