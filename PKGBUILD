# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Valère Monseur <valere dot monseur at ymail·com>

pkgname=eid-viewer
pkgver=4.1.18
pkgrel=2

pkgdesc="eID-Viewer is a graphical interface to the Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')

install=${pkgname}.install

# Do not try to have spaces or actually anything that is known to break parsing.
# https://goo.gl/fqwbSi
DLAGENTS=("http::/usr/bin/curl -A 'ArchLinux' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "http://eid.belgium.be/sites/default/files/downloads/$pkgname-$pkgver-v$pkgver.src.tar.gz"
)
sha512sums=(
    a07750be8d2d073a44aa4b4d37ac2b62f3c453f3963feb10a7eca22030f6cc18e845de111292defe9ee4fba78cf378ee03ecf01c5f7b436d300b315973099712
)

# There is no .asc signature file on the server.
# validpgpkeys=(
#     D95426E309C0492990D8E8E2824A5E0010A04D46 # Belgian eID Automatic Signing Key (continuous builds)
# )

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
