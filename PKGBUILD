# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Troy C < rstrox -ta yahoo -tod com >
# Contributor: Marek Skrobacki <skrobul@skrobul.com>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=meanwhile
pkgver=1.1.1
pkgrel=1
pkgdesc="Meanwhile libraries"
arch=('i686' 'x86_64')
url="https://github.com/obriencj/meanwhile"
license=('LGPL3')
depends=('glib2')
conflicts=('meanwhile-svn')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/obriencj/meanwhile/archive/v${pkgver}.tar.gz
        fix_groupchat.patch)
sha256sums=('10de306f03897572b30ce68ca80dffd04ec218f6842bbe0a47bb8cce933698d0'
            '54d0faa5702e3b89be2a4fe994cfb2c373f409add3ba6b340a06f183c7446b21')


prepare() {
  cd "$pkgname-$pkgver/src"
  patch -Np2 -i "${srcdir}/fix_groupchat.patch"
}

build() {
  cd "$pkgname-$pkgver"

  CFLAGS="-mtune=generic -pipe -fstack-protector --param=ssp-buffer-size=4"
  CXXFLAGS="${CFLAGS}"
  export CFLAGS CXXFLAGS

  ./configure --prefix=/usr --disable-doxygen --disable-mailme
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
