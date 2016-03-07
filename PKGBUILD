# Maintainer: Jiachen Yang <farseerfc@gmail.com>
pkgname=gochiusearch
pkgver=1.1.5902.28922
pkgrel=1
pkgdesc="Search by image of gochiusa"
arch=(any)
url="https://github.com/ksasao/Gochiusearch"
license=('Apache')
depends=('gtk-sharp-3')
makedepends=('git')
source=("gochiusearch::git+https://github.com/ksasao/Gochiusearch.git#commit=5370cb326177f3e15cdbcf07ecc52fb80eb56c82"
        "gochiusearch.sh")
sha512sums=('SKIP'
            '5c0b0fe8ecf0d1c876ed8eb7d9df7a67480145f9f197bfa79cc836ad9b60b5c09a2a1724425773450a1b9c575f2b7d2e8db5f1ad38dfe3c823fa155245c419e7')

build() {
  cd "$srcdir/gochiusearch/src/"
  xbuild /p:Configuration=Release Gochiusearch.sln
}

package() {
  cd "$srcdir/gochiusearch/src/Gochiusearch/bin/Release"
  install -dm755 "$pkgdir/usr/share/gochiusearch/"
  install -Dm755 Gochiusearch.exe "$pkgdir/usr/share/gochiusearch/"
  install -Dm755 ImageSearchEngine.dll "$pkgdir/usr/share/gochiusearch/"
  install -Dm644 index.db "$pkgdir/usr/share/gochiusearch/"
  install -Dm644 index.txt "$pkgdir/usr/share/gochiusearch/"
  install -Dm644 readme.txt "$pkgdir/usr/share/gochiusearch/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/gochiusearch.sh" "$pkgdir/usr/bin/gochiusearch"
}

# vim:set ts=2 sw=2 et:
