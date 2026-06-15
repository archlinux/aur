# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=python-spotifyscraper
_pkgname=spotifyscraper
pkgver=v3.2.0
pkgrel=1
pkgdesc="Extract public Spotify data — tracks, albums, artists, playlists, podcasts & lyrics — without the official API. Sync + async, typed models, one dependency."
arch=('any')
url="https://spotifyscraper.readthedocs.io"
depends=(
  'python>=3.10'
  'python-httpx>=0.27'
)
optdepends=(
  'python-mutagen: for spotifyscraper media'
  'python-playwright: for spotifyscraper browser'
  'python-typer: for spotifyscraper cli'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
checkdepends=(
  'python-pytest'
  'python-respx'
  'python-pytest-asyncio'
  'python-mutagen'
  'python-playwright'
  'python-typer'
  'python-pytest-timeout'
)

source=("git+https://github.com/AliAkhtari78/${_pkgname}#tag=${pkgver}")
license=('MIT')
sha256sums=('ef58c2a24e8042c77a28404f0057ac33eb8a139b9d20b005d9d8642ba6338c24')

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname"
  pytest
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
