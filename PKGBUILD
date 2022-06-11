# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=ignorefs
pkgver=1.0.3
pkgrel=1
arch=('x86_64')
pkgdesc="FUSE filesystem that hides/ignores files and directories based on an ignore file."
url="https://github.com/ryanpetris/ignorefs"
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-fuse' 'python-pathspec')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/ignorefs/archive/v${pkgver}.tar.gz")
sha512sums=('1cb7d73b1ca62fd0b45028dcb5ce5b57a02a3026cacf179a240117379af5d2c082d47a0b3e2adf85b050f05381ace155c8cce492c448050f711429c09314e8f6')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "scripts/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
