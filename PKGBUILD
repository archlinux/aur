# Maintainer: Jiachen Yang <farseerfc@gmail.com>
pkgname=gochiusearch
pkgver=1.1.5902.28922
pkgrel=2
pkgdesc="Search by image of gochiusa"
arch=(any)
url="https://github.com/ksasao/Gochiusearch"
license=('Apache')
depends=('gtk-sharp-3')
makedepends=('git')
source=("gochiusearch::git+https://github.com/ksasao/Gochiusearch.git#commit=5370cb326177f3e15cdbcf07ecc52fb80eb56c82"
        "gochiusearch.sh")
sha512sums=('SKIP'
            'f92c35a18c1c040d63ea5cfb371511d476a20a9a0560b3068c2f0da78d46ea2a72b3e33160571b83223942f3d6f78befe29d2b677b8023a0c9265759d718f6a8')

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
