pkgname=qudelix-cli-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A native macOS menu bar app for configuring the Qudelix 5K DAC/amp, over USB or Bluetooth."
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
provides=('qudelix')
conflicts=('qudelix')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/FrankieMa77/qudelix/refs/heads/main/LICENSE")
source_x86_64=("${pkgname%-bin}_${pkgver}_amd64.deb::https://github.com/FrankieMa77/qudelix/releases/download/v${pkgver}/qudelix_${pkgver}_amd64.deb")
sha256sums=('bf471dedf60354a5ab065b9446dcdf99a047327e841a3ceca5182ef0f4cb4216')
sha256sums_x86_64=('aef39778fffc26dd37a24c7c207c9b483f9c70a5a0b45e6d1e97b26e764510e2')

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
