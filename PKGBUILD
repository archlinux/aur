pkgname=qudelix-cli-bin
epoch=1
pkgver=0.7.1
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
sha256sums_x86_64=('ab3139958d2aad93a788aa621dba87fc7be4f9d74a8b81e2d9a4969e6d3791fc')

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
