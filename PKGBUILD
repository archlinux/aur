# Maintainer: Monjaris ziyanovruzlu750@gmail.com
pkgname=dotty
pkgver=0.3.1
pkgrel=4
pkgdesc="Dotfiles and config manager with profiles, written in C++"
arch=('x86_64')
url="https://github.com/Monjaris/dotty"
license=('GPL-3.0-or-later')
source=("git+$url.git#tag=v$pkgver")

depends=(
  'cli11'
  'git'
  'github-cli'
  'readline'
  'bat'
)

makedepends=(
  'xmake'
)

sha256sums=('SKIP')


build() {
    cd "$srcdir/dotty"
    xmake config -m release
    xmake build -j$(nproc) dotty
}

package() {
    cd "$srcdir/dotty"
    install -Dm755 build/linux/x86_64/release/dotty "$pkgdir/usr/bin/dotty"
}
