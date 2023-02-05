# Maintainer: LevitatingBusinessMan $(echo me-levitati+ng | sed s/\+/./g\;s/\-/@/)
# Previous maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

epoch=1
pkgver=0.4.3
pkgrel=3

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-cryptography'
         'python-pysocks' 'python-cffi' 'python-ntlm-auth' 'python-requests-ntlm' 'python-charset-normalizer')

changelog=CHANGELOG.md
backup=("etc/$pkgname/default.conf")
source=('CHANGELOG.md' "$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31cf9550a127217b69c48f2e5b718fa4ffa787a66eb0e9f0877e554bbfbf3fb0' 'acea117a5737b01a7c25c5d52057fc699382ee7079aeb3429c16d0ea6241b1db')


prepare() {
	sed -i '/^charset_normalizer/s/~=/>=/' "$srcdir/$pkgname-$pkgver/requirements.txt"
}

package() {
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
