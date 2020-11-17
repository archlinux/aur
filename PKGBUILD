# Maintainer: David Holland <info (at) dustvoice.de>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

pkgname="renoise-redux-beta"
pkgver="1.1.4"
pkgrel="1"
pkgdesc="A sampler VST plugin from Renoise"
arch=("x86_64")
url="https://www.renoise.com/products/redux"
license=("custom:redux")
depends=()
optdepends=()
makedepends=()
options=("!strip")
conflicts=("renoise-redux")

source=("file://rns_rdx_${pkgver//./}_linux.tar.gz")
md5sums=('SKIP')

prepare() {
    bsdtar xf "$srcdir/rns_rdx_${pkgver//./}_linux.tar.gz"
}

package() {
    cd "$srcdir/rns_rdx_${pkgver//./}_linux"

    cd "64bit"
    mkdir -p "$pkgdir/usr/lib/vst/renoise-redux.vst"
    cp -r "renoise_redux.so" "renoise_redux.res" "$pkgdir/usr/lib/vst/renoise-redux.vst"
    chmod -R 755 "$pkgdir/usr/lib/vst/renoise-redux.vst"

    cd "$srcdir/rns_rdx_${pkgver//./}_linux"

    cd "32bit"
    mkdir -p "$pkgdir/usr/lib32/vst/renoise-redux.vst"
    cp -r "renoise_redux.so" "renoise_redux.res" "$pkgdir/usr/lib32/vst/renoise-redux.vst"
    chmod -R 755 "$pkgdir/usr/lib32/vst/renoise-redux.vst"
}
