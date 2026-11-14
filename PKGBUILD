# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Mark Collins

pkgname="handy-bin"
pkgver=0.10.1
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
b2sums=('1d3b7420f19864b992423327de1f3665ba9bc202749c05ad12b6abf19772216aa665a49a859c3826333c9ce4b7660e168ed20c34864512925df2e671f62e5dd8'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package() {
    bsdtar -xf "data.tar.gz" -C "${pkgdir}"

    install -Dm644 "LICENSE_$pkgver" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    sed -i 's/Categories=/Categories=Utility;/g' "${pkgdir}/usr/share/applications/Handy.desktop"
}
