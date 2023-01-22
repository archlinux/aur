# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=maigret
pkgver=0.4.4
pkgrel=1
pkgdesc="Collect a dossier on a person by username from thousands of sites"
arch=(any)
url="https://github.com/soxoj/maigret"
license=(MIT)
makedepends=(python-setuptools)
checkdepends=(
  python-reportlab
  python-pytest
  python-pytest-asyncio
  python-pytest-asyncio
  python-pytest-cov
  python-pytest-httpserver
  python-pytest-rerunfailures
)
depends=(
  python-xmind
  socid-extractor
  python-aiodns
  python-aiohttp
  python-aiohttp-socks
  python-arabic-reshaper
  python-async-timeout
  python-attrs
  python-bidi
  python-certifi
  python-chardet
  python-cloudscraper
  python-colorama
  python-future
  python-future-annotations
  python-html5lib
  python-idna
  python-jinja
  python-lxml
  python-markupsafe
  python-mock
  python-multidict
  python-networkx
  python-pycountry
  python-pypdf2
  python-pysocks
  python-pyvis
  python-reportlab
  python-requests
  python-requests-futures
  python-six
  python-soupsieve
  python-stem
  python-torrequest
  python-tqdm
  python-typing_extensions
  python-webencodings
  python-xhtml2pdf
  python-yarl
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f890ad0986f94b1674324a17c011ec6a955e62fd87feb578707589371f08847f')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Don't hard lock dependency versions.
  sed -i 's/==.*//' requirements.txt
}

build() {
  cd "$_archive"

  python setup.py build
  rm -r build/lib/tests/
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
