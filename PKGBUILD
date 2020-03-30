# Maintainer: Chang Feng<chang_196700@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: boosterdev@linuxmail.org

pkgname=xdman
pkgver=7.2.10
pkgrel=1
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('i686' 'x86_64')
url="https://subhra74.github.io/xdm/"
depends=('java-runtime>=11')
license=('GPL')
source=(
  'xdman.bin'
  'https://github.com/subhra74/xdm/releases/download/7.2.10/xdm-setup-7.2.10.tar.xz'
)
sha256sums=(
  'bb7e28fe2873c3fbaffd9a7448835d4d2a210f7cf136dd683f3bb389f0f03f91'
  'aa7ca244dc77b32b16f8e416400d316f6d9fcea21d5584c09e7cd488e242c958'
)

prepare () {
  cd $srcdir
  dd if="install.sh" bs=8K skip=1 | tar -xvJf -
  rm -rf opt/xdman/jre
  rm -rf opt/xdman/uninstall.sh
}

package() {
  install -d -m755 "$pkgdir"/opt/xdman
  install -D -m644 "$srcdir"/usr/share/applications/xdman.desktop "$pkgdir"/usr/share/applications/xdman.desktop
  cp -dr --no-preserve='ownership' "$srcdir"/opt/xdman "$pkgdir"/opt/
  install -D -m755 "$srcdir"/xdman.bin "$pkgdir"/opt/xdman/xdman

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/xdman/xdman" "$pkgdir/usr/bin/xdman"
}
