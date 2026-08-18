# Maintainer: Ryan Wu <ryanwusd at gmail dot com>

pkgname=yt-collate
_name=${pkgname//-/_}
pkgver=0.0.3
pkgrel=2
pkgdesc="Efficient, well-rounded YouTube Music TUI client"
arch=('any')
url="https://github.com/indigo0445/yt-collate"
license=('MIT')
depends=(
  python
  python-textual
  python-ytmusicapi
  python-pydantic
  python-pydantic-settings
  python-pypresence
  mpv
  yt-dlp-nightly-bin
  nodejs
  ffmpeg
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_name-$pkgver.tar.gz")
sha256sums=('ad538c745ad460bf52e00b669cc57ae0b7fc84ed9d53710865cd846fc1dc88bd')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
