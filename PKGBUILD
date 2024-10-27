# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=python-llvmcpy-git
_pkgname=python-llvmcpy
pkgver=r47.9b7e56f
pkgrel=1
pkgdesc="Python bindings for LLVM auto-generated from the LLVM-C API "
arch=(any)
url="https://rev.ng/llvmcpy"
license=('MIT')
depends=('llvm' 'python' 'python-appdirs' 'python-cffi' 'python-packaging' 'python-pycparser')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("git+https://github.com/revng/llvmcpy.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/llvmcpy"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/llvmcpy"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
