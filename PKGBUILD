# Maintainer: zocker-160 <zocker1600@posteo.net>

pkgname=simpleflash-git
pkgver=r14.9c9a269
pkgrel=1
pkgdesc='Simple CLI application for flashing to and backing up from USB drives'
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/zocker-160/simpleflash"
license=("GPL-3.0-only")
makedepends=("git" "go")
provides=("simpleflash")
conflicts=("simpleflash")

source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  go build -trimpath -ldflags='-s -w' -o simpleflash .
}

package() {
  cd "$pkgname"
  install -Dm755 simpleflash "$pkgdir/usr/bin/simpleflash"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
