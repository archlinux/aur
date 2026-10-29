# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python-gruut-ipa
_name=gruut-ipa
pkgver=0.13.0
pkgrel=3
pkgdesc="Library for manipulating pronunciations using the International Phonetic Alphabet (IPA)"
arch=("any")
url="https://github.com/rhasspy/gruut-ipa"
license=("MIT")
depends=("python"
         "python-scikit-learn")
makedepends=("python-build"
             "python-installer"
             "python-setuptools"
             "python-wheel")
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('635e04bce1a4017d0e80b11504c8ac8d045a332c76ff2835c2343c87b8d943a0')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

check(){
 cd "$_name-$pkgver"
 python -m unittest discover -s tests
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
