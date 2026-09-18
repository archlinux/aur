# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Mark Collins

pkgname="handy-bin"
pkgver=0.9.7
pkgrel=1
pkgdesc="A free, open source, and extensible speech-to-text application that works completely offline"
url="https://handy.computer/"
license=("MIT")
arch=("x86_64")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    "alsa-lib"
    "cairo"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "gtk-layer-shell"
    "hicolor-icon-theme"
    "libappindicator-gtk3"
    "libsoup3"
    "openblas"
    "openssl"
    "vulkan-icd-loader"
    "webkit2gtk-4.1"
)
optdepends=(
  'wtype: Wayland virtual input support'
  'xdotool: X11 virtual input support'
  'kwtype-git: KDE Plasma virtual input support'
)
source=("${pkgname}-${pkgver}.deb::https://github.com/cjpais/Handy/releases/download/v${pkgver}/Handy_${pkgver}_amd64.deb"
        "LICENSE_$pkgver::https://raw.githubusercontent.com/cjpais/Handy/refs/tags/v$pkgver/LICENSE")
b2sums=('a38b4fc71f6fab202c7df18a700bc7fb4a5d38fa78a1d19f381e77381a007333fbcad3133e5bc53cd8ceb7f28dcf99b3c382f81927550ce9cd7808e75f100d3f'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package() {
    bsdtar -xf "data.tar.gz" -C "${pkgdir}"

    install -Dm644 "LICENSE_$pkgver" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    sed -i 's/Categories=/Categories=Utility;/g' "${pkgdir}/usr/share/applications/Handy.desktop"
}
