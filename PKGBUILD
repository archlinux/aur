# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=scim-anthy
pkgver=1.2.7
pkgrel=6
_filecode=37309
pkgdesc='Japanese input method module for SCIM'
url='http://sourceforge.jp/projects/scim-imengine/'
arch=('x86_64')
license=('GPL')
depends=('scim' 'anthy')
source=("http://osdn.dl.sourceforge.jp/scim-imengine/${_filecode}/${pkgname}-${pkgver}.tar.gz"
        scim-anthy-fix-build.patch)
sha256sums=('cb60070d8f6ff281a99d329c9d731f02ae16893083c9efa9970ccd7287365198'
            '30d025963eab608295415bdb19b5baf65c650ecdfec639414ee29d3422f35a64')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../scim-anthy-fix-build.patch # Fedora patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
