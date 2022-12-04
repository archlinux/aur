# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="python-ruff"
_pkgname="ruff"
pkgver=0.0.157
pkgrel=1
pkgdesc="An extremely fast Python linter, written in Rust."
url="https://github.com/charliermarsh/ruff"
arch=("any")
sha256sums=('c20b076b43f2f0c8c74ee0cdbeebfbd9b7095963ab8a108ef7f5ed01569c4c56')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
license=("MIT")
depends=("python")
makedepends=("rust" "python-pip" "python-build")

build() {
  cd "ruff-${pkgver}"
  python -m venv --system-site-packages build-venv
  build-venv/bin/pip install maturin
  build-venv/bin/python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "ruff-${pkgver}"
  pip install "dist/ruff-${pkgver}-py3-none-linux_x86_64.whl" --root="${pkgdir}/"
}

