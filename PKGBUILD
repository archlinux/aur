# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=9anime
_gitname=9anime-client
pkgver=0.r1.ea7016b
pkgrel=1
pkgdesc='9anime electron client'
arch=('any')
license=('MIT')
makedepends=('git')
provides=('9anime')

source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  chmod +x 9-anime
  mv 9-anime 9anime
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin/"
  touch "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
  echo "exec /usr/share/$pkgname/$pkgname" > "$pkgdir/usr/bin/9anime"
}
