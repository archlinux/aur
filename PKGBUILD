pkgname=qudelix-cli-bin
epoch=1
pkgver=0.8.0
pkgrel=1
pkgdesc="Unofficial command-line control for the Qudelix 5K: volume, DAC filter, EQ, presets, AutoEq"
arch=('x86_64')
url="https://github.com/FrankieMa77/qudelix"
license=('MIT')
depends=(
    'curl'
    'dbus'
    'glibc'
    'libgcc'
    'libstdc++'
)
provides=('qudelix-cli')
conflicts=('qudelix-cli')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/FrankieMa77/qudelix/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${pkgname%-bin}_${pkgver}_amd64.deb::https://github.com/FrankieMa77/qudelix/releases/download/linux-v${pkgver}/qudelix_${pkgver}_amd64.deb")
sha256sums=('bf471dedf60354a5ab065b9446dcdf99a047327e841a3ceca5182ef0f4cb4216')
sha256sums_x86_64=('80a1ead3344b1b83cabbdcefe8e626fe2be7bb6f77763d199c9e762ca6f4d414')

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
