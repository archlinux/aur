# Maintainer: Amro Emad <korialo001 at gmail dot com>

# Note: added `skip-dependecy-check` as a work-around setuptool being limited to < 81 by upstream
# Also less important check tests are mainly coverage we do not want that anyway.

pkgname=python-spotifyscraper
_pkgname=spotifyscraper
pkgver=v2.1.5
pkgrel=2
pkgdesc="Spotify Scraper to extract all the information from spotify, download mp3 with cover of the song"
arch=('any')
url="https://spotifyscraper.readthedocs.io"
depends=(
  'python-requests'
  'python-beautifulsoup4'
  'python-yaml'
  'python-eyed3'
  'python-urllib3'
  'python-click'
  'python-rich'
  'python-toml'
)
optdepends=('python-selenium: for JavaScript content'
	    'python-webdriver-manager: automatically downloads and manages browser drivers for Selenium')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-lxml'
  'python-cssselect'
  'python-soupsieve'
  'python-filetype'
  'python-fake-useragent'
  'python-packaging'
  'python-tqdm'
  'python-pyparsing'
  'python-deprecation'
  'python-certifi'
)

source=("git+https://github.com/AliAkhtari78/${_pkgname}#tag=${pkgver}")
license=('MIT')
sha256sums=('a946a388f28e140640ae6c4975364befc9ef47ff9b2beef5a184687790f3fce2')

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
