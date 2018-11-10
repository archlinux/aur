# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Rainer Moll <renari@arcor.de>

pkgname=t1lib
pkgver=5.1.2
pkgrel=7
pkgdesc="Library for generating character- and string-glyphs from Adobe Type 1 fonts"
arch=('x86_64')
url="https://www.ibiblio.org/pub/Linux/libs/graphics/!INDEX.html"
license=('GPL')
depends=('libxaw')
source=(https://www.ibiblio.org/pub/Linux/libs/graphics/${pkgname}-${pkgver}.tar.gz
        lib-cleanup.diff
        format-security.diff
        CVE-2011-0764.diff
        CVE-2011-1552_1553_1554.patch
        CVE-2010-2642.patch)
sha256sums=('821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59'
            '5b161f4e0f4ad297ad8eea70ea99620f5db6f7e487bbd63a819b6a9958540961'
            '89b0aa7ca57fd8e9753336033c1d3e3e58c6c79e943144430e8af9a4626fdd25'
            'a763650bdcffd33a61cd2cecef766b8d6baa9999561463ae9dfdc20d55caef04'
            '4bc34e092fdec37e06b38b5b7a3b02194732dbe6a39edbd174b36c2db1f113ac'
            'dcd9064f368e0fc1f3ede0a45e61b364f6b5d3607dccae78ac07e74ca315a27d')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../lib-cleanup.diff
  patch -Np1 -i ../format-security.diff
  patch -Np1 -i ../CVE-2011-0764.diff
  patch -Np1 -i ../CVE-2011-1552_1553_1554.patch
  patch -Np1 -i ../CVE-2010-2642.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make without_doc
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
