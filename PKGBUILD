# Maintainer: Monjaris ziyanovruzlu750@gmail.com
pkgname=dotty
pkgver=0.4.9
pkgrel=7
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

sha256sums=('c3f20cd25953379f03abf628238c4631b9fc47a4382a641f63e70b1b8c03bd7e')

build() {
    cd "$srcdir/dotty-${pkgver}"
    xmake config -m release
    xmake build -j$(nproc) dotty
}

package() {
    cd "$srcdir/dotty-${pkgver}"
    install -Dm755 build/linux/x86_64/release/dotty "$pkgdir/usr/bin/dotty"
}
