pkgname=qudelix-app-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A native macOS menu bar app for configuring the Qudelix 5K DAC/amp, over USB or Bluetooth."
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
    'libstdc++'
    'pango'
    'vulkan-icd-loader'
)
provides=('qudelix')
conflicts=('qudelix')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/FrankieMa77/qudelix/refs/heads/main/LICENSE")
source_x86_64=("${pkgname%-bin}_${pkgver}_amd64.deb::https://github.com/FrankieMa77/qudelix/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('bf471dedf60354a5ab065b9446dcdf99a047327e841a3ceca5182ef0f4cb4216')
sha256sums_x86_64=('5d789bf0253d9fc2276bf80a81d805d18e5d8f59d9fa11af87d6a7ebe54d172f')

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
