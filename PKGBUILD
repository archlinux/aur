# Maintainer: robertfoster
pkgname="python-dtschema-git"
pkgver=2024.02.r14.64b72b0
pkgrel=1
pkgdesc="Tools and schema data for Devicetree schema validation using the json-schema vocabulary"
arch=(any)
url="https://github.com/devicetree-org/dt-schema"
license=("BSD-2-Clause")
depends=(
  'dtc'
  'python-jsonschema'
  'python-rfc3987'
  'python-ruamel-yaml'
  'python-tqdm'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "${pkgname%-git}::git+${url}"
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  printf "%s" "$(git describe --long | sed 's/^v//g' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('SKIP')
