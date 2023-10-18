# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=sxmo-dmenu
pkgver=5.0.14
pkgrel=1
pkgdesc="Dmenu for sxmo - works via using volume/power keys for seletion along with some other patches"
arch=('x86_64')
provides=('dmenu')
conflicts=('dmenu')
url="https://git.sr.ht/~mil/sxmo-dmenu"
license=('MIT')
source=("${pkgname}-${pkgver}::$url/archive/$pkgver.tar.gz")
sha256sums=('bbd6877b73db93b95f8bf15c33d5137a9a675ea335bf916d9318b84686284cea')
depends=(
    'glibc'
    'libfontconfig.so'
    'libxft'
    'bash'
    'libxinerama'
    'libx11'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
    echo "CFLAGS+=${CFLAGS}" >> config.mk
    echo "LDFLAGS+=${LDFLAGS}" >> config.mk
}

build() {
    cd "${pkgname}-${pkgver}"
    make \
	  X11INC=/usr/include/X11 \
	  X11LIB=/usr/lib/X11 \
	  FREETYPEINC=/usr/include/freetype2
}

package() {
    cd ${pkgname}-${pkgver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd ${pkgdir}/usr/bin
}

