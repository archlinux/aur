# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.22.0
pkgrel=2
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
         'python-distro>=1.0.2' 'python-distro<1.1.0'
         'python-pluginbase>=0.5' 'python-pluginbase<1.0'
         'python-pylint>=1.6.4' 'python-pylint<1.6.6')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "pylint-1.6.4.patch")
sha512sums=('069676785b353ff6c059a8ecabc62c53554e440b9208007eac5ef3fb3c634589c079392b7e197c5179f68b8e01655a888ffea5a2019587b7289c1f0d110de444'
            '390efc6caf461c1c3f78a77c88847486fb97e7d1a5d81036b93dbc9526c365d084a2b2f60d2df6a2040be6aae859285d4feb9b3b238646585508a42d7eb7ea76')

prepare() {
 cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/pylint-1.6.4.patch"
  }
  

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
