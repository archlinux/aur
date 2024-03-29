# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-tantivy-simsapa-git'
pkgver='r193.cf899cc'
pkgdesc='Python bindings for Tantivy, Simsapa fork'
pkgrel=1
arch=('x86_64')
url='https://github.com/simsapa/tantivy-py'
license=('MIT')
depends=('python>=3.7' 'glibc' 'gcc-libs')
provides=('python-tantivy-py-simsapa')
optdepends=()
makedepends=(
  'cargo'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel')
source=("${pkgname}::git+${url}.git#branch=simsapa")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  # Requires Internet connection to get crates
  make build
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dvm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
