# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyclaude
pkgver=0.12.15
pkgrel=1
pkgdesc="lazygit-style TUI for Claude Code customizations"
arch=('any')
url="https://github.com/nikiforovall/lazyclaude"
license=('MIT')
depends=('python' 'python-pathspec' 'python-pyperclip' 'python-rich' 'python-textual' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/l/lazyclaude/lazyclaude-${pkgver}.tar.gz")
sha256sums=('c322e6bb24cb014459b5c8904dd7ae1e3568af95a44b2956a35a645c4aa1966b')

build() {
  cd "lazyclaude-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "lazyclaude-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
