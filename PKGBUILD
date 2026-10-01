# Maintainer: killermoehre <killermoehre@gmx.net>
pkgname=evolution-sieve-filters
pkgver=0.4.7
pkgrel=1
pkgdesc="Evolution plugin to manage server-side Sieve filters"
arch=("i686" "x86_64")
url="https://github.com/cyr-ius/evolution-sieve-filters"
license=('GPL-3.0-only')
depends=("evolution" "evolution-data-server" "glib2" "gtk3" "gsasl" "libsecret" "krb5")
makedepends=("meson")
source=("https://github.com/cyr-ius/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("ae816291cabc63182cce48eee607df81151251b2f13faa757c9c77723fabe5fa")

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
