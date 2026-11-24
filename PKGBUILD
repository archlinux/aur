# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oshit
pkgver=1.0.0
pkgrel=1
pkgdesc="Hacker News reader for the terminal"
arch=('any')
url="https://github.com/davep/oshit"
license=('GPL-3.0-only')
depends=('python' 'python-httpx' 'python-humanize' 'python-textual' 'python-xdg-base-dirs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/o/oshit/oshit-${pkgver}.tar.gz")
sha256sums=('fcb7ca147345a92a99592dae31dfbd420364156297723566b5277660c9c684a3')

build() {
  cd "oshit-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "oshit-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
