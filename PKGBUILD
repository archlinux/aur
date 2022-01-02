# Maintainer: pk <patrik@nuit.cz>
# Contributor: FabioLolix
# Contributor: Johannes Frankenau

pkgname=oil-search
pkgver=0.3.2
pkgrel=2
pkgdesc='Search-as-you-type cli frontend for the buku bookmarks manager using peco. '
arch=('any')
url='https://github.com/AndreiUlmeyda/oil'
license=('GPL3')
depends=('buku' 'peco' 'jq' 'xsel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AndreiUlmeyda/oil/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('065f4bdcff8ef6642cb1b5fe9c8e95844be26e9a4935859672528b0f76d08adb')

package() {
  cd "oil-${pkgver}"
  make PREFIX=/usr BINDIR=/usr/bin LIBDIR=/usr/lib/oil-search DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/oil" "${pkgdir}/usr/bin/oil-search"
  sed -i 's/LIBDIR=\/usr\/local\/lib\/oil/LIBDIR=\/usr\/lib\/oil-search/' "${pkgdir}/usr/bin/oil-search"
  ln -s /usr/bin/oil-search "${pkgdir}/usr/bin/oils"
}
