# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gpicsync
pkgver=1.33
pkgrel=1
pkgdesc='Inserts location in your pictures metadata from a GPS tracklog'
arch=('any')
url="https://github.com/metadirective/GPicSync"
license=('GPL2')
depends=('python' 'python-pillow' 'python-unidecode' 'python-wxpython')
makedepends=('git' 'imagemagick')
install=$pkgname.install
_commit=667f4db2d7d4373d99f83024b5b1c400f03f089f  # master
source=("git+https://github.com/FrancoisSchnell/GPicSync.git#commit=$_commit"
        $pkgname $pkgname.desktop)
md5sums=('SKIP'
         'dbc7781c637ce04e652ec40fdc5e0130'
         '099f9d4091fd05941bfaa9d87aa4d1b7')

prepare() {
  cd "${srcdir}"/GPicSync/src
  convert $pkgname.ico +set date:create +set date:modify -alpha on $pkgname.png
}

package() {
  cd "${srcdir}"/GPicSync/src

  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png

  install -d "${pkgdir}"/usr/share/$pkgname
  cp -r locale "${pkgdir}"/usr/share/$pkgname
  cp {*.py,*.jpg,*.ico,*.conf} "${pkgdir}"/usr/share/$pkgname
}
