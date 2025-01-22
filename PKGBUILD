# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=python-pyrofork-git
provides=("${pkgname%-git}" python-pyrogram)
conflicts=("${pkgname%-git}" python-pyrogram)
replaces=(python-pyrogram) # pyrogram is dead
pkgver=2.3.56.r4724.5676006
pkgrel=1
pkgdesc="Pyrogram fork with Adjustable web page preview, Quote Reply, Story & Topics Support, Mongodb session storage, and much more."
arch=("any")
url="https://github.com/Mayuri-Chan/pyrofork"
license=("LGPL-3.0-or-later")
depends=("python" "python-pyaes" "python-pysocks" "python-pymediainfo")
optdepends=(
  "python-tgcrypto: faster cryptography"
  "python-uvloop: fast, drop-in replacement of the built-in asyncio event loop"
)
makedepends=("git" "python-build" "python-installer" "python-wheel" "python-hatchling")
checkdepends=("python-pytest" "python-pytest-asyncio" "python-pytest-cov")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
# Greatly speeds up the `package` phase.
# There are no binaries anyway.
options=(!strip)

pkgver() {
  cd "${pkgname}"
  printf "%s.r%s.%s" "$(python -m hatchling version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
