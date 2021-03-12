# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=0.4.1.alpha.r183.ae36ca7
pkgrel=2

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$_name"
license=('GPL2')

provides=("$_name")
conflicts=("$_name")

makedepends=('git')
depends=('python')

changelog=CHANGELOG.md
backup=("usr/lib/$_name/default.conf")
source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
  cd "$_name"
  rm -r logs reports
  sed -i 's/^\(save-logs-home\s*=\s*\)False/\1True/' default.conf
}

package() {
  cd "$_name"
  install -dm755 "$pkgdir/usr"/{bin,"lib/$_name"}
  cp -a --no-preserve=o db lib thirdparty default.conf dirsearch.py "$pkgdir/usr/lib/$_name/"
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$_name/"
  ln -s "/usr/lib/$_name/$_name.py" "$pkgdir/usr/bin/$_name"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
