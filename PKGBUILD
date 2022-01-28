# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=fragments-git
pkgver=1.9.1.r54.gae38fee
pkgrel=2
pkgdesc="BitTorrent client for GNOME"
arch=(i686 x86_64 armv6h armv7h)
url="https://gitlab.gnome.org/World/Fragments"
license=(GPL3)
depends=(gtk4 libadwaita transmission-cli)
makedepends=(git meson rust)
provides=(fragments)
conflicts=(fragments)
source=("git+https://gitlab.gnome.org/World/Fragments.git")
sha256sums=('SKIP')

pkgver() {
    cd Fragments
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson Fragments build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
