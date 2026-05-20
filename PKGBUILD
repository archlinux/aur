# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=gabagent
pkgver=0.1.0
pkgrel=1
pkgdesc="Claude Code-style AI coding assistant built on the Gab AI Developer API"
arch=('any')
url="https://github.com/indyfive11/gabagent"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.12'
  'python-openai'
  'python-rich'
  'python-prompt_toolkit'
  'python-httpx'
  'python-html2text'
  'python-typer'
  'python-pydantic'
  'python-pydantic-settings'
  'python-anyio'
  'python-jsonlines'
  'python-ddgs'
)
optdepends=(
  'python-playwright: headless browser support for JS-rendered pages'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f41d5c9008beb421b253cb3f590f6547753b12857265f918da1b70abe3a90e8')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
