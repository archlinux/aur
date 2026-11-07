# Maintainer: libele <libele@disroot.org>

_pkgname=PunyInform
pkgname=punyinform
pkgver=6.8
_pkgver="${pkgver//./_}"
pkgrel=1
pkgdesc="A fast and compact Inform 6 library"
arch=('any')
url="https://github.com/johanberntsson/PunyInform"
license=('MIT')
groups=('inform')
checkdepends=('inform' 'ruby')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/johanberntsson/PunyInform/archive/refs/tags/v$_pkgver.tar.gz"
	'punyinform.sh')
sha256sums=('5b7bc02161ff57d47fdafd08972cdb00fcf9aa4e4a9a02a2b262e78ae2cd862c'
            'b2fafaddc1100ae9bda1b3ddb0bd269cee292fabedcaff123aa9928daed85b92')

prepare() {
  sed -i.bak 's|local/share/inform|share|g' punyinform.sh

  cd "$_pkgname-$_pkgver/documentation"
  rm -r guides screenshots technical
}

check() {
  cd "$_pkgname-$_pkgver/tests"
  make
}

package() {
  install -vdm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$_pkgname-$_pkgver/"* "$pkgdir/usr/share/$pkgname"
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/share/$pkgname" -name .vimrc -delete

  install -Dm755 punyinform.sh "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
