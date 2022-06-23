# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-icon-theme
pkgver=3.12.0
pkgrel=7
pkgdesc="GNOME icon theme"
arch=(any)
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'gnome-icon-theme-symbolic')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
options=('!emptydirs')
source=("https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz"
        "0001-configure.ac-Do-not-manually-set-localedir.patch")
sha256sums=('359e720b9202d3aba8d477752c4cd11eced368182281d51ffd64c8572b4e503a'
            '02e47f80f36904071d7377d7b06083e3ce5f70c9b1ce2d190ac4a1bb90efcac8')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "../0001-configure.ac-Do-not-manually-set-localedir.patch"
}

build() {
    cd "$pkgname-$pkgver"
    autoupdate && autoreconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -f "${pkgdir}/usr/share/icons/gnome/icon-theme.cache"
}
