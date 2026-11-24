# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dotenvhub
pkgver=0.6.1
pkgrel=1
pkgdesc="Centrally manage .env files from a TUI"
arch=('any')
url="https://github.com/Zaloog/dotenvhub"
license=('MIT')
depends=('python' 'python-platformdirs' 'python-pyperclip' 'python-textual' 'python-textual-jumper')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/d/dotenvhub/dotenvhub-${pkgver}.tar.gz")
sha256sums=('64bc755fe5037148145c4206c219ff20c78a15ca8357da007424537a298ddcc8')

build() {
  cd "dotenvhub-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "dotenvhub-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  mv "${pkgdir}/usr/bin/dot" "${pkgdir}/usr/bin/dotenvhub"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
