# Maintainer: Polyfish0 <igamblenull@gmail.com>
pkgname="python-pytermgui-git"
pkgdesc="Easy building of TUIs in Python"
source=("python-pytermgui-git::git+https://github.com/bczsalba/pytermgui.git")
url="https://github.com/bczsalba/pytermgui"
provides=(python-pytermgui)
depends=("python>=3.7" ipython python-wcwidth python-typing_extensions python-yaml)
makedepends=(python-hatchling python-hatch-fancy-pypi-readme python-build python-installer python-wheel git)
optdepends=("python-pytest: for running tests")
arch=(any)
license=(MIT)
pkgver=v7.7.1.r3.ge6ef8b3
pkgrel=1
sha256sums=("SKIP")

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
