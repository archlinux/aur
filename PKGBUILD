# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.25.1
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0' 'python-pyjwt<2.0.0'
         'python-requests>=2.7.0' 'python-requests<3.0.0'
         'python-colorama>=0.3.3' 'python-colorama<0.4.0'
         'python-yaml>=3.11' 'python-yaml<3.13.0'
         'python-patch=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver=0.1.1'
         'python-bottle>=0.12.8' 'python-bottle<0.13'
         'python-distro>=1.0.2' 'python-distro<1.1.0'
         'python-pluginbase>=0.5' 'python-pluginbase<1.0'
         'python-pylint>=1.6.5'
         'python-future=0.16.0'
         'python-pygments>=2.0' 'python-pygments<3.0')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "arch-deps.patch")
md5sums=('1a1f7ad114cdf6f279a1d8d27786a8bd'
         'a354ef73eb5bf895bb7f6773ad5d4f01')


prepare() {
cd $pkgname-$pkgver
patch -Np1 -i "${srcdir}/arch-deps.patch"
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
