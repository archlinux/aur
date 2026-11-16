# Maintainer: Mikhail Velichko <efklid@gmail.com>
# Contributor: Lolka Team <support@lolka.app>

pkgname=lolka-x-bin
pkgver=2.0.11
pkgrel=1
pkgdesc='Native desktop client for lolka.app - chat and voice with friends'
arch=('x86_64')
url='https://lolka.app'
license=('LicenseRef-LolkaX')
# Qt and FFmpeg are bundled; list only external runtime requirements here.
depends=(
    'glibc' 'gcc-libs' 'glib2' 'dbus' 'gtk3'
    'fontconfig' 'freetype2' 'krb5' 'zlib'
    'libglvnd' 'mesa' 'libpulse'
    'libx11' 'libxi' 'libxext' 'libxtst'
    'libxkbcommon' 'libxkbcommon-x11'
    'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm'
    'openssl' 'xdg-utils'
)
provides=('lolka-x' 'lolka' 'lolka-bin')
conflicts=('lolka-x' 'lolka' 'lolka-bin')
# Preserve upstream's prebuilt libraries and avoid generating a debug package.
options=('!strip' '!debug')

source=("lolka-x-${pkgver}-${arch[0]}.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/${pkgver}/${pkgname}-${pkgver}-1-${arch[0]}.pkg.tar.zst")
noextract=("lolka-x-${pkgver}-${arch[0]}.pkg.tar.zst")
sha512sums=('632383034ad9d420022b7a99eb4b53d7b9ae86ddf19981ea5267421280f50357be23fce2c26aefad19d1573330c6cbbc79f66bc5c9cf1ea9efbaf9e89490007d')

package() {
    bsdtar -xf "$srcdir/lolka-x-${pkgver}-${arch[0]}.pkg.tar.zst" -C "$pkgdir" \
        --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' \
        --exclude='.INSTALL' --exclude='.CHANGELOG'
}
