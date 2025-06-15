# Maintainer: <vcalv>

_name=ollama-gui
pkgname="${_name}-tk"
pkgver=1.2.1
pkgrel=1
pkgdesc="tkinter-based Ollama GUI"
arch=(any)
url="https://github.com/chyok/ollama-gui"
license=(MIT)
depends=(
	'python>3.6'
)
optdepends=(
)
source=($pkgname-$pkgver.tar.gz::https://github.com/chyok/ollama-gui/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5c6805de0ec966c11554d6f94d36f8f18fc484408d27f4dbb19f5138fa1ee10acd4b4b70f0d984e468e48da47df18ebbceefef1b528115d581f59ae6fef64495')

build() {
  cd "$_name-$pkgver";
  python -m build --wheel --no-isolation
}


package() {
  cd "$_name-$pkgver";
  python -m installer --destdir="$pkgdir" dist/*.whl

  mv "$pkgdir/usr/bin/ollama-gui" "$pkgdir/usr/bin/ollama-gui-tk"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
