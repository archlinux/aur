# Maintainer: Chang Feng<chang_196700@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: boosterdev@linuxmail.org

pkgname=xdman
_pkgver=7.2.11
pkgver=2020.${_pkgver}
pkgrel=2
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('i686' 'x86_64')
url="https://subhra74.github.io/xdm/"
depends=('java-runtime>=11')
license=('GPL')
source=(
  'xdman.bin'
  "https://github.com/subhra74/xdm/releases/download/${_pkgver}/xdm-setup-${_pkgver}.tar.xz"
)
sha256sums=(
  'f50e60e27a8b70c03b564853a3c11a59105915891782c581cc803356e0008739'
  '140413651797d97b13c5f1a2f0c528da6e46d3652bd36abd743b1a69dc610438'
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
