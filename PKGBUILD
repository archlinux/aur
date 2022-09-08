# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch-git
_name="${pkgname%-git}"

epoch=1
pkgver() { git -C "$_name" describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=0.4.2.r298.ec05dec
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$_name"
license=('GPL2')

provides=("$_name")
conflicts=("$_name")

makedepends=('git' 'python-setuptools')
depends=('python' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-cryptography'
         'python-pysocks' 'python-cffi')

changelog=CHANGELOG.md
source=("git+$url.git")
sha256sums=('SKIP')


prepare() { sed -i '/^charset_normalizer/s/~=/>=/' "$_name/requirements.txt"; }

package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$_name/"
  ## fix the default.conf file location
  #local py_ver="$(python -V | sed 's/Python \(3\.[0-9]\+\).*/\1/')"
  #cd "$pkgdir"
  #install -dm755 "etc/$_name"
  #mv "usr/lib/python$py_ver/site-packages/$_name/default.conf" "etc/$_name/"
  #ln -sv "/etc/$_name/default.conf" "usr/lib/python$py_ver/site-packages/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
