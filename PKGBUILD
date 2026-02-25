# Maintainer: Deniz Köse denizkose@proton.me

pkgname=smtk-obs-git
pkgver=r3.2e93fd5
pkgrel=1
pkgdesc="A lightweight OBS Browser Source overlay for showmethekey using Bun and WebSockets"
arch=('any')
url="https://github.com/denizkose/smtk-obs"
license=('MIT')
depends=('showmethekey' 'bun')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "$pkgdir/usr/share/smtk-obs"  
  install -m644 index.ts overlay.html output.css "$pkgdir/usr/share/smtk-obs/"
  install -Dm755 smtk-obs-server "$pkgdir/usr/bin/smtk-obs-server"
}
