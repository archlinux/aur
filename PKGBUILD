# Maintainer: killermoehre <killermoehre@gmx.net>
pkgname=evolution-sieve-filters
pkgver=0.6.3
pkgrel=1
pkgdesc="Evolution plugin to manage server-side Sieve filters"
arch=("i686" "x86_64")
url="https://github.com/cyr-ius/evolution-sieve-filters"
license=('GPL-3.0-only')
depends=("evolution" "evolution-data-server" "glib2" "gtk3" "gsasl" "libsecret" "krb5")
makedepends=("meson")
source=("https://github.com/cyr-ius/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("3853071e3b4595aa05bdd79eac28f71df10840be2826b7abba760be655d397f5")

prepare() {
    meson subprojects download --sourcedir="$pkgname-$pkgver"
}

build() {
    arch-meson build "$pkgname-$pkgver"
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
