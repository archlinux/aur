# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: alerque (https://aur.archlinux.org/account/alerque)
# Contributor: robertfoster
# Contributor: Robert Booster

pkgbase=python-gmusicapi
pkgname="${pkgbase}"
pkgver="13.0.0"
pkgrel=6
pkgdesc="An unofficial client library for Google Music."
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD-3-Clause')
depends=(
  'python-appdirs'
  'python-dateutil'
  'python-decorator'
  'python-gpsoauth'
  'python-mechanicalsoup'
  'python-mock'
  'python-mutagen'
  'python-oauth2client'
  'python-protobuf'
  'python-requests'
  'python-validictory'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=()
optdepends=(
  # 'python-proboscis: For tests.' # This is not needed, since `check()` would not work anyway and and `python-proboscis` is discontinued anyway, see https://aur.archlinux.org/packages/python-gmusicapi#comment-927318. This line here is kept around so that future maintainers know the reason why we do _not_ want to have it included.
)
source=(
  "https://github.com/simon-weber/gmusicapi/archive/${pkgver}.tar.gz"
)
md5sums=(
  'ce06c4cc1aa34946814c57b75f4132ae'
)
conflicts=("${pkgname}-git")
provides=()

build() {
  cd "${pkgname##python-}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname##python-}-$pkgver"
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


