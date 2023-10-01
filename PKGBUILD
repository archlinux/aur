# Maintainer: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Evert Vorster <evorster@gmail.com>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan1')
_pkgname=('conan')
pkgver=1.61.0
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager. Version 1, to help people transition to version 2"
arch=('any')
url="https://conan.io"
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('MIT')
makedepends=('python-setuptools' 'patch')
depends=('python-requests>=2.25'
         'python-urllib3>=1.26.6'
         'python-colorama>=0.3.3'
         'python-yaml>=3.11'
         'python-patch-ng>=1.17.4'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver>=0.6.1'
         'python-distro>=1.0.2'
         'python-pygments>=2.0'
         'python-tqdm>=4.28.1'
         'python-jinja>=3.0'
         'python-dateutil>=2.7.0'
         'python-bottle>=0.12.8'
         'python-pluginbase>=0.5'
         'python-pyjwt>=2.4.0')

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/conan-io/conan/archive/${pkgver}.tar.gz")

prepare() {
  cd $_pkgname-$pkgver
  # Remove maximum version constraints
  sed -i -r 's|(.*),.*|\1|g' conans/requirements.txt
  sed -i -r 's|(.*),.*|\1|g' conans/requirements_server.txt
  sed -i -r 's|(.*),.*|\1|g' conans/requirements_dev.txt
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
md5sums=('03b2e38494683d85c255c777e9422ff1')
