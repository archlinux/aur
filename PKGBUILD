# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=conan-git
pkgver=0.11.1.r2.g093bbda
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
depends=('python'
         'python-pyjwt>=1.4.0' 'python-pyjwt<1.5.0'
         'python-requests>=2.7.0' 'python-requests<2.12.0'
         'python-colorama>=0.3.3' 'python-colorama<0.4.0'
         'python-passlib>=1.6.5' 'python-passlib<1.7.0'
         'python-boto>=2.38.0' 'python-boto<2.43.0'
         'python-yaml>=3.11' 'python-yaml<3.13.0'
         'python-patch=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-bottle>=0.12.8' 'python-bottle<0.13')
makedepends=('python-setuptools')
provides=('conan')
conflicts=('conan')
source=("conan-git::git+https://github.com/conan-io/conan.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
}
