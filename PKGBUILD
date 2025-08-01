# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rbackup-git
pkgver=v0.2.8.r6.g0b52d2b
pkgrel=1
pkgdesc="Fast, cross-platform, multithreaded incremental backup tool (rsync/robocopy-like) written in Rust (master branch)"
arch=('x86_64')
url="https://github.com/umpire274/rbackup"
license=('MIT')
depends=()
provides=('rbackup')
conflicts=('rbackup')
source=("git+https://github.com/umpire274/rBackup.git")
sha256sums=('SKIP')
# Keywords: backup, incremental, rust, rsync, robocopy, multithreaded, portable, cli
pkgver() {
  cd rBackup
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd rBackup
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/rBackup/target/release/rbackup" "$pkgdir/usr/bin/rbackup"
  install -Dm644 "$srcdir/rBackup/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/rBackup/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

