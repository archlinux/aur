pkgname=zournal-git
pkgver=r59.a3e0713
pkgrel=3
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
makedepends=('git' 'zig')
source=("git+${url}.git")
sha256sums=('SKIP')
provides=('zournal')
conflicts=('zournal-bin')

pkgver() {
  cd "$srcdir/Zournal"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Zournal"
}

build() {
  cd "$srcdir/Zournal"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$srcdir/Zournal"

  install -Dm755 "zig-out/bin/zournal" "$pkgdir/usr/bin/zournal"
  install -Dm644 "resources/zournal.desktop" "$pkgdir/usr/share/applications/zournal.desktop"
}
