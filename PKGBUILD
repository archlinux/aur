# Maintainer: N/A <N/A>

pkgname=polaronproton-git
_pkgname=polaronproton
pkgver=r2.44c6f0d
pkgrel=1
pkgdesc="Symlink manager for Steam Play (Proton) prefixes"
url="https://github.com/Meister1593/polaronproton"
arch=("x86_64" "aarch64")
license=("MIT")
makedepends=("git" "rust")
provides=("polaronproton")
conflicts=("polaronproton")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_git_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm 755 "target/release/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname"
}
