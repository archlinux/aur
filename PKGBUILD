pkgname=qudelix-app-bin
epoch=1
pkgver=0.7.0
pkgrel=1
pkgdesc="Unofficial GTK desktop app for the Qudelix 5K: volume, DAC filter, EQ, presets, AutoEq, tray menu"
arch=('x86_64')
url="https://github.com/FrankieMa77/qudelix"
license=('MIT')
depends=(
    'cairo'
    'curl'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'graphene'
    'gtk4'
    'harfbuzz'
    'hicolor-icon-theme'
    'libadwaita'
    'libgcc'
    'libpipewire'
    'libstdc++'
    'pango'
    'vulkan-icd-loader'
)
optdepends=(
    'librsvg: icon'
    'gnome-shell-extension-appindicator: tray icon on GNOME'
    'qudelix-cli: qudelix CLI utility'
)
provides=('qudelix-app')
conflicts=('qudelix-app')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/FrankieMa77/qudelix/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${pkgname%-bin}_${pkgver}_amd64.deb::https://github.com/FrankieMa77/qudelix/releases/download/linux-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('bf471dedf60354a5ab065b9446dcdf99a047327e841a3ceca5182ef0f4cb4216')
sha256sums_x86_64=('7b9138c9986931466c259d0c26392f9bd14f57152fc5b0b83770bd7c57b86efd')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}/"
}

package() {
    # The DEB payload already contains /usr/bin/openidea, the desktop entry
    # and the hicolor icons.
    cp -r "${srcdir}/usr" "${pkgdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
