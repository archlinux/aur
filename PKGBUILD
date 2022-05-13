# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rapidfuzz'
pkgname="python-${_pkgname}"
pkgver=2.0.11
pkgrel=2
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=('x86_64')
url='https://github.com/maxbachmann/rapidfuzz'
license=('MIT')
depends=('python-jarowinkler')
makedepends=(
    'cpp-taskflow'
    'jarowinkler-cpp'
    'python-numpy'
    'python-rapidfuzz-capi'
    'python-scikit-build'
    'python-setuptools'
    'rapidfuzz-cpp'
)
optdepends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('934b65fea75e3bd310d74903ec69ff3df061b3058ab5b7f49ab772958109bca8')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build \
      -G "Unix Makefiles" \
      --build-type None \
      -DCMAKE_CXX_FLAGS_INIT=-fmacro-prefix-map="${srcdir@Q}"=. # remove references to srcdir
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py --skip-cmake install --root="$pkgdir" --optimize=1 --skip-build

  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
