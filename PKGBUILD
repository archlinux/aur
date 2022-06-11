# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=ignorefs
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
pkgdesc="FUSE filesystem that hides/ignores files and directories based on an ignore file."
url="https://github.com/ryanpetris/ignorefs"
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-fuse' 'python-pathspec')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/ignorefs/archive/v${pkgver}.tar.gz")
sha512sums=('d767d7d55d6d5d95f14bc10cf5baaa1c6c284c6f25dc8f43f83b66a6014d7b85ba34a7c0914a3df17d3bc70e6ce5c827be87f882ded3551c61639e8a2d07cf73')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "scripts/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
