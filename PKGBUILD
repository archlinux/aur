# Maintainer: <vcalv>

_name=ollama-gui
pkgname="${_name}-tk"
pkgver=1.2.2
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
sha512sums=('5969f14474f29a77571a88e9122b7ec1fe5292ea589a23a479dad448182da495f30659024d287d96f44c7b232fc0429e431359eca3bac5012b9c01221644314b')

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
