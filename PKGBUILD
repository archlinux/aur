# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.22.2
pkgrel=2
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0' 'python-pyjwt<1.6.0'
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
         'python-pylint>=1.6.4' 'python-pylint<1.6.6'
         'python-future=0.16.0')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "pylint-1.6.4.patch" "pyjwt-1.5.0.patch")
sha512sums=('60f019ad0d00d1ecbb153ee5e108361a8928f97c24e39eefe054838e86c5f1ea9a55f76a2eaebda647c3017d786863a8f50ebb2a8860aa202f73062405b64f01'
            '2d4ccf533f3d6efb478cdcecc6b1e320fa1dcfe8328c7f288bfc735c99a5ae5741446a1df69cd8dbb166fd84f801bb473d1f15026ca8773f73f7640475a40aa6'
            'ff7d7561ffab07db03c062fccf9862415e1286e256ccba1b4200dc62a4adbea3eead16bca4ae2236a90fbc6ce1b431eac9490793643176a2e81c1997590bb2ba')

prepare() {
 cd $pkgname-$pkgver
 patch -Np1 -i "${srcdir}/pylint-1.6.4.patch"
 patch -Np1 -i "${srcdir}/pyjwt-1.5.0.patch"
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
