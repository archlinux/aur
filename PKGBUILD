# Maintainer: Michael Bauer <bauermi86944@th-nuernberg.de>
# Contributor: 

pkgname=('conan2')
_name=${pkgname//2/}
pkgver=2.0.0_alpha6
_ver=${pkgver//_/-}
pkgrel=1
pkgdesc="Decentralized, open-source (MIT), C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=(
  'python-requests>=2.25'
  'python-urllib3>=1.26.6'
  'python-colorama>=0.3.3'
  'python-yaml>=3.11'
  'python-patch-ng>=1.17.4'
  'python-fasteners>=0.14.1'
  'python-distro>=1.0.2'
  'python-jinja>=3.0'
  'python-dateutil>=2.7.0')
provides=('conan=$_ver')
conflicts=('conan' 'conan-git')

source=("https://github.com/conan-io/conan/archive/$_ver.tar.gz")

build() {
  cd "$srcdir/$_name-$_ver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$_ver"
  python setup.py install --optimize=1 --root=$pkgdir --skip-build
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
  install -m755 -d "${pkgdir}/usr/share/doc/conan"
  install -m644 contributors.txt "${pkgdir}/usr/share/doc/conan/"
}

b2sums=('8147dc406d0e1a8870b4e844926441362a91220c6d4755bff8fdd8a67ed7a708078f3c6b03df74d9b7ff65a0dd844c8a6cf124634c8c0569c74e542d6940031e')
