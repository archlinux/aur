# Maintainer: teraflops <me@priet.us>
pkgname=roon-kit
pkgver=0.1.0.r$(date +%s)
pkgrel=1
pkgdesc="A JavaScript SDK for the Roon API"
arch=('any')
url="https://github.com/Stevenic/roon-kit"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

# pkgver() {
#   cd "$srcdir/$pkgname"
#   printf "0.1.0.r%s.g%s" \
#     "$(git rev-list --count HEAD)" \
#     "$(git rev-parse --short HEAD)"
# }

build() {
  cd "$srcdir/$pkgname"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$pkgname/bin/roon-kit.js" "$pkgdir/usr/bin/roon-kit"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

