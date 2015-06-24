pkgname="yaaw-git"
pkgver=r124.a5d2d30
pkgrel=1
pkgdesc="Yet Another Aria2 Web Frontend in pure HTML/CSS/Javascirpt. PKGBUILD source code at https://github.com/gutenye/aurs/tree/master/$pkgname"
arch=("i686" "x86_64")
url="https://github.com/binux/yaaw"
license=("GPL")
makedepends=("git")
provides=("yaaw")
conflicts=("yaaw")
source=(
  "$pkgname::git://github.com/binux/yaaw.git"
  "apache.example.conf"
  "nginx.example.conf")
md5sums=('SKIP'
         '6bcbdb5390332f13e3bc5c6cbf5524c7'
         'a04cf9b8610507f54505487a15b411cc')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/webapps/yaaw"
  mkdir -p "$pkgdir/etc/webapps/yaaw"
  cp -r * "$pkgdir/usr/share/webapps/yaaw"
  cp ../*.example.conf "$pkgdir/etc/webapps/yaaw"
  chown http:http -R "$pkgdir/usr/share/webapps/yaaw"
}

# vim:set ts=2 sw=2 et:
