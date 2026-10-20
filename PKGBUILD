# Maintainer: Aneesh Sambu <sambu.aneesh@research.iiit.ac.in>
pkgname=subs
pkgver=0.1.1
pkgrel=1
pkgdesc='Subtitle TUI with fuzzy matching, guided TV episodes, and automatic sidecar downloads'
arch=('any')
url='https://github.com/sambuaneesh/subs'
license=('MIT')
depends=(
  'python>=3.11'
  'python-httpx>=0.27'
  'python-rapidfuzz>=3'
  'python-rich>=13'
  'python-guessit>=3.8'
  'python-babelfish>=0.6'
  'python-beautifulsoup4>=4.12'
  'python-textual>=0.89'
  'python-pysubs2>=1.7'
  'python-charset-normalizer>=3'
  'yt-dlp>=2025.1'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
optdepends=('ffmpeg: extract embedded text subtitle tracks from local videos')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a89f5a024cb21457d69dc92acb83ef7ceaefbab60c70182d960b46269416e33')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH="$PWD/src${PYTHONPATH:+:$PYTHONPATH}" python -m pytest -q
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 artifacts/*.svg -t "$pkgdir/usr/share/doc/$pkgname/artifacts/"
}
