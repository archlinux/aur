# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.19.3
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0' 'python-pyjwt<1.5.0'
         'python-requests>=2.7.0' 'python-requests<2.14.0'
         'python-colorama>=0.3.3' 'python-colorama<0.4.0'
         'python-yaml>=3.11' 'python-yaml<3.13.0'
         'python-patch=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver=0.1.1'
         'python-bottle>=0.12.8' 'python-bottle<0.13'
         'python-distro>=1.0.2' 'python-distro<1.1.0')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz")
sha512sums=('66f33f7317cbffe0bc9d51bb3d4d4cdee65f03487d20c687253c2a48cd8c7744222c1cbe3b33bcd22a8d1774b86087f81479a55620cec5a88df926a7a2f6121a')

build() {
  cd "$srcdir/conan-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/conan-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
  install -m755 -d "${pkgdir}/usr/share/doc/conan"
  install -m644 contributors.txt "${pkgdir}/usr/share/doc/conan/"
}
