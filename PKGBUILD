# Maintainer: Rafael Just <rafaeljust at proton dot me>
pkgname="powerlevel11k-git"
pkgver=r341.609c215
pkgdesc="Powerlevel10k continuation for all shells"
pkgrel=1
arch=("x86_64")
conflicts=('powerlevel11k')
url="https://github.com/Qaaxaap/powerlevel11k"
license=("GPL-3.0-or-later")
makedepends=('rust' 'cmake' 'gettext' 'pkg-config' 'libssh2')
source=("powerlevel11k::git+https://github.com/Qaaxaap/powerlevel11k.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/powerlevel11k"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/powerlevel11k"
    export LIBSSH2_SYS_USE_PKG_CONFIG=1 # Build fails to find libssh2 functions if not included
    cargo build --release --locked
}

package() {
    cd "$srcdir/powerlevel11k"
    install -Dm755 target/release/p11k "${pkgdir}/usr/bin/p11k"
}
