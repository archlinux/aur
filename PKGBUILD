# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.16.0
pkgrel=2
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0' 'python-pyjwt<1.5.0'
         'python-requests>=2.7.0' 'python-requests<2.13.0'
         'python-colorama>=0.3.3' 'python-colorama<0.4.0'
         'python-passlib>=1.6.5' 'python-passlib<1.8.0'
         'python-boto>=2.38.0' 'python-boto<2.44.0'
         'python-yaml>=3.11' 'python-yaml<3.13.0'
         'python-patch=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver=0.1.1'
         'python-bottle>=0.12.8' 'python-bottle<0.13')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "passlib-1.7.0.patch")
sha512sums=('078bf08b2f63812f204b9070590a3deb1ec338d702b81a918076ecedf8598bd5c309d05c3deccc3d735b35770847b4acaee37a81f0f0b2e5dd2c2165afdca41d'
            'cec321ce5c34cd254dd1aac434b210cda93444deb7c8fc24cf3abe3847ea7786d6ffcb3ef2d5366ed0a5ba8d0eade09b205f5993279fdd5de871e6dba32ed702')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/passlib-1.7.0.patch"
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
