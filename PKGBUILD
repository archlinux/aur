# Maintainer: Ainola
# Contributor: rtfreedman
# Contributor: Philipp Überbacher
#
# invada-studio-fixes.patch taken from https://code.launchpad.net/~shanipribadi/invada-studio/fixes

pkgname=invada-studio-plugins-lv2
pkgver=1.2.0
pkgrel=7
pkgdesc="A set of LV2 audio effect plugins, ported from VST."
arch=('i686' 'x86_64')
url="https://launchpad.net/invada-studio/"
license=('GPL2')
groups=('lv2-plugins')
makedepends=('lv2')
depends=('gtk2')
source=("https://launchpad.net/invada-studio/lv2/1.2/+download/${pkgname}_${pkgver}-nopkg.tgz"
        "invada-studio-fixes.patch")
sha256sums=('c6cac7c32effc6b3052e3b017133244f385ef8e053147859d88eae6facaf7d12'
            'd1e5a50d27f1f3e04da6486cee65e0d0e21ae25387bb661d3bfed6411eace733')

prepare() {
    patch -d "$pkgname-$pkgver" -p1 < invada-studio-fixes.patch
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_SYS_PLUGINS_DIR=/usr/lib/lv2 \
         DESTDIR="$pkgdir" install-sys
}

