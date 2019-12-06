# Maintainer: Oscar Rainford <oscar@fourbytes.me>
pkgname=vpncloud
pkgver=1.1.0
pkgrel=1
pkgdesc='Peer-to-peer VPN'
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('libsystemd')
makedepends=('rust' 'cargo' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/dswd/vpncloud.rs.git#tag=v1.1.0')
noextract=()
sha256sums=('SKIP')
validpgpkeys=('6B5BBBCA2E3392315CC47434694A43B9C7FE6EA9')

prepare() {
        cd vpncloud.rs
}

build() {
        cd vpncloud.rs

        # Build w/ release optimisations,
        cargo build --release
}

package() {
        cd vpncloud.rs
        
        install -d $pkgdir/etc/vpncloud
        install -m600 assets/example.net.disabled $pkgdir/etc/vpncloud/example.net.disabled

	install -D -m644 assets/vpncloud.1 $pkgdir/usr/share/man/man1/vpncloud.1
        install -D -m644 assets/vpncloud@.service $pkgdir/usr/lib/systemd/system/vpncloud@.service
        install -D -m755 target/release/vpncloud $pkgdir/usr/bin/vpncloud
}
