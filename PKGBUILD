# Maintainer: meister1593 <leruop@gmail.com>

pkgname=polaronproton-git
_pkgname=polaronproton
pkgver=0.10.0.r3.g5c6cd2f
pkgrel=1
pkgdesc="Symlink manager for Steam Play (Proton) prefixes"
url="https://github.com/Meister1593/PolaronProton"
arch=("x86_64" "aarch64")
license=("MIT")
makedepends=("git" "rust")
provides=("polaronproton")
conflicts=("polaronproton")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"{,-cli}
}
