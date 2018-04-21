# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-brightness-control-applet
pkgver=0.2
pkgrel=1
pkgdesc="Brightness control applet for budgie desktop"
arch=('i686' 'x86_64')
url='https://github.com/ilgarmehmetali/budgie-brightness-control-applet'
license=('GPL2')
sha512sums=('d73bb509c0f901feed3841b0d52f637ef2f9ae3628cac02f14eec4e1532ae17e0d5784795c081967c083ff79961097b2b0aa46fdc4761e760a91fca5e11d0624')
depends=('libpeas' 'budgie-desktop' 'gnome-settings-daemon')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=("https://github.com/ilgarmehmetali/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    meson --prefix /usr --buildtype=plain ..
    ninja
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
}
