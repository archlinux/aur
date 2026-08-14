# Maintainer: Monjaris ziyanovruzlu750@gmail.com
pkgname=dotty
pkgver=0.6.7
pkgrel=8
pkgdesc="Dotfiles and config manager with profiles, written in C++"
arch=('x86_64')
url="https://github.com/Monjaris/dotty"
license=('GPL-3.0-or-later')
source=("dotty-${pkgver}.tar.gz::https://github.com/Monjaris/dotty/archive/refs/tags/v${pkgver}.tar.gz")

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

sha256sums=('2c3e58d55c7c7fcdc333ceeca64530699249ab3a2107fe831d93b15cc97fd391')

build() {
    cd "$srcdir/dotty-${pkgver}"
    xmake config -m release
    xmake build -j$(nproc) dotty
}

package() {
    cd "$srcdir/dotty-${pkgver}"
    install -Dm755 build/linux/x86_64/release/dotty "$pkgdir/usr/bin/dotty"
}
