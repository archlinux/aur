# Maintainer: <max at swk-web.com>

_extname=spx
pkgname=php-${_extname}
pkgver=0.4.18
pkgrel=2
pkgdesc="A simple & straight-to-the-point PHP profiling extension with its built-in web UI"
arch=('i686' 'x86_64')
url="https://github.com/NoiseByNorthwest/php-spx"
makedepends=('php>=5.6')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NoiseByNorthwest/php-spx/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/NoiseByNorthwest/php-spx/v${pkgver}/LICENSE")
sha256sums=('1f0554080cb5aec5803b0773daefc23ef6ab4faa3e4554e2302d739c127da210'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

build() {
  cd "${pkgname}-${pkgver}"

  phpize
  ./configure --with-php-config=/usr/bin/php-config --prefix=/usr
  make
}

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
