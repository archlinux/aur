# Maintainer: Stephan Henrichs <stiepen22@gmx.de>
_pkgname=lockd
pkgname=$_pkgname-git
pkgver=0.2
pkgrel=1
pkgdesc="A simple utility for managing your lock screen on a tiling wm (like i3, dwm, xmonad or awesome)"
arch=(i686 x86_64)
url="https://github.com/Kilobyte22/lockd"
license=('MIT')
optdepends=(
  'i3lock: screen locking with default config'
)
makedepends=(git rust)
install=
source=("lockd::git+https://github.com/Kilobyte22/lockd.git#branch=develop" "local://$_pkgname.service")
noextract=()
md5sums=('SKIP'
         '0f9e968b906d26cc0f4255afe30f2eaa')
conflicts=(lockd)
provides=(lockd)

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$srcdir/$_pkgname/target/release/lockd" "$pkgdir/usr/bin/lockd"
    install -Dm755 "$srcdir/$_pkgname/target/release/lockctl" "$pkgdir/usr/bin/lockctl"
    install -Dm644 "$srcdir/$_pkgname/lockctl.1" "$pkgdir/usr/man/man1/lockctl.1"
    install -Dm644 "$srcdir/$_pkgname/lockd.1" "$pkgdir/usr/man/man1/lockd.1"
    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
