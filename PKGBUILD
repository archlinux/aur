# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.22.3
pkgrel=3
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0' 'python-pyjwt<1.6.0'
         'python-requests>=2.7.0' 'python-requests<2.15.0'
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
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "pylint-1.7.1.patch" "pyjwt-1.5.0.patch" "requests-2.14.2.patch")
sha512sums=('7b111845c7b9c84f97b6749ab691476e78987875c2f84025c8e0aba85e99468830ff0bfcab8e0f714c533126fc9260248dce02c7a712bca037dfc888157962eb'
            '5ceee883e35f6b9c9f74c18fd6d2f6881f5550e0d1a2d0b14fa1066949b436e725566f3f8db71799c2e120ae554f99db52029ec22abf1cab6a80c30303842af8'
            'ff7d7561ffab07db03c062fccf9862415e1286e256ccba1b4200dc62a4adbea3eead16bca4ae2236a90fbc6ce1b431eac9490793643176a2e81c1997590bb2ba'
            '2d49a38c74b7b7e0d43839811a8adc7aa2f2f56821ef17ec5f9eef1c64fde194f42ce94032836f7ec7292bef3294ba34d6defc8c773f668eb208b7c098985e0b')

prepare() {
 cd $pkgname-$pkgver
 patch -Np1 -i "${srcdir}/pylint-1.7.1.patch"
 patch -Np1 -i "${srcdir}/pyjwt-1.5.0.patch"
 patch -Np1 -i "${srcdir}/requests-2.14.2.patch"
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
