# Maintainer: Stephan Henrichs <stiepen22@gmx.de>
pkgname=lockd
pkgver=0.1
pkgrel=2
pkgdesc="A simple utility for managing your lock screen on a tiling wm (like i3, dwm, xmonad or awesome)"
arch=(i686 x86_64)
url="https://github.com/Kilobyte22/lockd"
license=('MIT')
depends=(i3lock)
makedepends=(git cargo)
install=
source=("lockd::git+https://github.com/Kilobyte22/lockd.git#tag=v$pkgver" "local://$pkgname.service")
noextract=()
md5sums=('SKIP'
         '0f9e968b906d26cc0f4255afe30f2eaa')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/bin
    install $srcdir/$pkgname/target/release/lockd $pkgdir/usr/bin/lockd
    install $srcdir/$pkgname/target/release/lockctl $pkgdir/usr/bin/lockctl
    install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/user/$pkgname.service
}
