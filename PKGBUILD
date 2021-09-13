# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

epoch=1
pkgver=0.4.2
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-cryptography'
         'python-pysocks' 'python-cffi')

changelog=CHANGELOG.md
backup=("etc/$pkgname/default.conf")
source=("$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d5109408a40d45b8324beb1abd7cae8fdd28a00fd54c57a86a7017eaea1d93f758524a05820e7f4f0c3342bdf61d0003be49f56693804992e920f52d218aad76')


package() {
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$pkgname/"
  local py_ver="$(python -V | sed 's/Python \(3\.[0-9]\+\).*/\1/')"
  install -dm755 "$pkgdir/etc/$pkgname"
  # hack to fix the default.conf file location
  mv "$pkgdir/usr/lib/python$py_ver/site-packages/$pkgname/default.conf" "$pkgdir/etc/$pkgname/"
  ln -s "/etc/$pkgname/default.conf" "$pkgdir/usr/lib/python$py_ver/site-packages/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
