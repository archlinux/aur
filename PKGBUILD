# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=ignorefs
pkgver=1.0
pkgrel=1
arch=('x86_64')
pkgdesc="FUSE filesystem that hides/ignores files and directories based on an ignore file."
url="https://github.com/ryanpetris/ignorefs"
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-fuse' 'python-pathspec')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/ignorefs/archive/v${pkgver}.tar.gz")
sha512sums=('30c74a69fabac2cf3a1dffc5d0ea88f50beeb585374adae8b9d34f0a88000f7f7c62b5712682b895f78485fb76d9849ee8dee398f7615df9fd12a1098195a345')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "scripts/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
