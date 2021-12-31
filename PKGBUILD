# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-application
pkgname=python-application
pkgver=3.0.3
pkgrel=2
pkgdesc="Basic building blocks for Python applications"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-application"
depends=('python' 'python-zope-interface')
conflicts=('python3-application')
provides=('python3-application')
replaces=('python3-application')
source=("https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz" "fix_MutableMapping.patch")
sha512sums=('5fd9bd0df4312a912534e38ed8a20116134efa4008641399cffc0d16d581bcdb799135290c88f11572903e8b76702f312dc01776814edbede3b38aa8f8006cc0'
  '580221215f8c94afa1b73f029964feecbb646882cdae8feb333ee7fef0034bcd584b0d0b2c883bd2aa07bc541da36e6e596901a14365b7d6cf6cbdb669e14a52'
  )

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/fix_MutableMapping.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
