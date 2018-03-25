# Maintainer: Sean Enck <enckse@gmail.com>
_name=pyxstitch
pkgname=python-$_name
pkgver=1.7.6
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-setuptools' 'python-pygments')
optdepends=("bash-completion: for bash completions")
_md5='305bcc8d5e69294b9b52227fbac013fb'
_rawcontent="https://raw.githubusercontent.com/enckse/$_name/v$pkgver/"
source=("https://pypi.python.org/packages/15/0a/4a98c83afe1bc4045546a67a958cd58f94ec0fc75f6f5b9df7108d1fad2a/$_name-$pkgver.tar.gz#md5=$_md5"
        "${_rawcontent}LICENSE"
        "${_rawcontent}completions/bash"
        "${_rawcontent}doc/$_name.1")
md5sums=("$_md5" "09b2ac6fbde8b1a1c4f223aa3ffedbba" "d4f45e5816e653b3ba21c779bbe9e5da" "4b252e0daec56eed0a4beb806ff8ce0a")

build() {
  sed -i "s/<Date>/$(date +"%B %Y")/g;s/<Version>/$pkgver/g" pyxstitch.1
  rm -f *.gz
  gzip pyxstitch.1
}

package() {
  install -Dm644 pyxstitch.1.gz $pkgdir/usr/share/man/man1/pyxstitch.1.gz
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 bash $pkgdir/usr/share/bash-completion/completions/pyxstitch
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
