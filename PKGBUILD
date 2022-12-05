# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Got some parts from python-black package.

pkgname="python-ruff"
_pkgname="ruff"
pkgver=0.0.158
pkgrel=1
pkgdesc="An extremely fast Python linter, written in Rust."
url="https://github.com/charliermarsh/ruff"
arch=("any")
sha256sums=('dc8a38d429437d896365ac3f9f2f1c234b19b963eaff9662d32f844b684dbc37')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
license=("MIT")
depends=("python")
makedepends=("rust" "maturin" "python-pip" "python-build" "python-installer")

build() {
  cd "ruff-${pkgver}"
  python -m venv --system-site-packages build-venv
  build-venv/bin/pip install maturin
  build-venv/bin/python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "ruff-${pkgver}"
  python -m installer --destdir="$pkgdir" "dist/ruff-${pkgver}-py3-none-linux_x86_64.whl"
}

