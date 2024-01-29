# Maintainer: LevitatingBusinessMan $(echo me-levitati+ng | sed s/\+/./g\;s/\-/@/)
# Previous maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=dirsearch
pkgver=0.4.3
pkgrel=5
pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL-2.0-only')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
depends=('python' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-cryptography'
         'python-pysocks' 'python-cffi' 'python-ntlm-auth' 'python-requests-ntlm' 'python-charset-normalizer'
         'python-jinja' 'python-defusedxml' 'python-markupsafe' 'python-pyopenssl' 'python-idna'
         'python-requests' 'python-colorama' 'python-pyparsing' 'python-beautifulsoup4')
changelog=CHANGELOG.md
source=('CHANGELOG.md' "$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31cf9550a127217b69c48f2e5b718fa4ffa787a66eb0e9f0877e554bbfbf3fb0' 'acea117a5737b01a7c25c5d52057fc699382ee7079aeb3429c16d0ea6241b1db')

prepare() {
  sed -i '/^charset_normalizer/s/~=/>=/' "$srcdir/$pkgname-$pkgver/requirements.txt"
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
