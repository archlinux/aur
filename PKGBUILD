# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=ignorefs
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
pkgdesc="FUSE filesystem that hides/ignores files and directories based on an ignore file."
url="https://github.com/ryanpetris/ignorefs"
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-fuse' 'python-pathspec')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/ignorefs/archive/v${pkgver}.tar.gz")
sha512sums=('bc932f8f3efce3ded21099cd7ebc26548e36b607bd6d78fac082f4037e82c07c39accde26dc5785a891d08e0ec91f0270dd998045a3c758f596516f2b4ea7efe')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "scripts/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
