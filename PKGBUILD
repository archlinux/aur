# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Last Version: curl -s 'https://oligarchy.co.uk/xapian/?C=M;O=D' | grep -oh '>[0-9]*\.[0-9]*\.[0-9]*\/<' |  grep -oh '[0-9]*\.[0-9]*\.[0-9]*' | head -n 1

pkgname=php-xapian
pkgver="$(curl -s 'https://oligarchy.co.uk/xapian/?C=N;O=D' | grep -oh '>[0-9]*\.[0-9]*\.[0-9]*\/<' |  grep -oh '[0-9]*\.[0-9]*\.[0-9]*' | head -n 1)"
epoch=1
pkgrel=4
pkgdesc="PHP bindings for Xapian"
arch=(
    'armv7h'
    'i686'
    'x86_64'
    )
url="http://xapian.org/docs/bindings/php/"
depends=(
    'php7'
    'xapian-core'
        )
license=(
    'GPL'
	)

_fileName="xapian-bindings-${pkgver}"
source=("http://oligarchy.co.uk/xapian/${pkgver}/${_fileName}.tar.xz")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_fileName}"
  ./configure \
    XAPIAN_CONFIG=/usr/bin/xapian-config \
    --prefix=/usr \
    --with-php7
  make
}

package() {
  cd ${srcdir}/${_fileName}
  make DESTDIR="$pkgdir" install
}
