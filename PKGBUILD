# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=atom
_pkgmaintainer=file-icons
_pkgdestdirname=atom-file-icons
_versionprefix=v
pkgver=2.1.32
pkgrel=1
pkgdesc="Atom file-specific icons for improved visual grepping."
pkgname=ttf-${_pkgdestdirname}
arch=(any)
url="https://atom.io/packages/file-icons"
license=('MIT')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('woff2-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('d335c46e3e4d1ba8cac44b1ba1923a6341a7f3a8608317a63368657fa7e47931')
install=$pkgname.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/fonts/"
  woff2_decompress file-icons.woff2
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/"
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 fonts/file-icons.ttf "$pkgdir/usr/share/fonts/TTF/${_pkgdestdirname}.ttf"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
