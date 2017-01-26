# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.18.1
pkgrel=3
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
         'python-bottle>=0.12.8' 'python-bottle<0.13')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "requests-2.13.0.patch")
sha512sums=('c1ecfc47eb39d196871e957e1cd28e0d19ad1f5bd0ef2f9988818af469174256d537c77ef90a55842d47683b97c16ccbf8e5f0e0aec239c22fbd80b009daf265'
            'dda8b4a53c57dd888f5f28c7d4808fbdedb466e7f44e779baea4b19d613bd84001b7b7db4dc7c5698aeb1815b8a4496220a51abfe9476ab542f6f314b0f73c2a')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/requests-2.13.0.patch"
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
