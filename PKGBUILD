# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.23.2
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
         'python-future=0.16.0')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "arch-deps.patch")
sha512sums=('95cbfe699bf05c212ebf034da071ec53a3bb4c81cc33a1821c3f0e237686ecdeeb88f677bf8425e42e30a8a4c0c65b29ebd52100bc8241184907036eb4984aa0'
            '061141627deb43423bbcd9281b97ddb64b560923a1a411a2338d6d8720417904356626ce82386d740fffb3838bbcd029d1f13bfb17d9ef6b8abd4e45157ef74b')

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
