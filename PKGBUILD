# Maintainer: <max at swk-web.com>

_extname=spx
pkgname=php-${_extname}
pkgver=0.4.22
pkgrel=3
pkgdesc="A simple & straight-to-the-point PHP profiling extension with its built-in web UI"
arch=('i686' 'x86_64')
url="https://github.com/NoiseByNorthwest/php-spx"
makedepends=('php>=5.6')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NoiseByNorthwest/php-spx/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/NoiseByNorthwest/php-spx/v${pkgver}/LICENSE")
sha256sums=('6f89addd100d3d71168c094612eb8e1c06fd8062da6ee4d9df5b31bdfc4de160'
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
