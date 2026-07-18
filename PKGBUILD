# shellcheck shell=bash
# -*- sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alex Avance <aravance at gmail dot com>

pkgname='sparklines'
pkgdesc='Text-based sparklines for the command line mimicking those of Edward Tufte'
pkgver=1.0.0
pkgrel=5
url="https://github.com/deeplook/$pkgname"
changelog="$pkgname.changelog"
arch=('any')
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-termcolor'
)
optdepends=(
  'python-psutil: needed to run the example(s)'
  'python-textual: needed to run the example(s)'
)
provides=({,python-}"$pkgname")
conflicts=("python-$pkgname")
replaces=("python-$pkgname")
options=('!strip')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  'fe7a7b9293c769e8b60e5403b10c11543fc22c683ef1272385d9cff5142274c0'
)

build() {
  cd "$pkgname-$pkgver"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md CONTRIBUTORS.txt README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.*
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.txt
}

# eof
