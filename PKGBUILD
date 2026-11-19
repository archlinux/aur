# Maintainer: Rafael Just <rafaeljust at proton dot me>
pkgname="powerlevel11k-git"
pkgver=r487.feaf405
pkgdesc="Powerlevel10k continuation for all shells. (git version)"
pkgrel=3
arch=("x86_64")
conflicts=('powerlevel11k')
provides=('powerlevel11k')
url="https://github.com/Qaaxaap/powerlevel11k"
license=("GPL-3.0-or-later")
makedepends=('git' 'rust' 'cmake' 'gettext' 'pkg-config' 'libssh2' 'libgit2')
source=("powerlevel11k::git+https://github.com/Qaaxaap/powerlevel11k.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$srcdir/powerlevel11k"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/powerlevel11k"
    cargo build --release --locked
}

package() {
    cd "$srcdir/powerlevel11k"
    install -Dm755 target/release/p11k "${pkgdir}/usr/bin/p11k"
}
