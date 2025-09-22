# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: ArjixWasTaken <me@arjix.dev>

pkgname=winboat-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Run Windows apps on Linux with seamless integration"
arch=(x86_64)
url="https://www.winboat.app"
license=('MIT')
depends=('docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

options=("!strip" "!debug")

source=(
  "https://github.com/TibixDev/winboat/releases/download/v${pkgver}/winboat-${pkgver}-amd64.deb"
)
sha256sums=('363f5ce2de0787aeee4c40601cbf787f50ab0b372269dd4b0ea542a7c8deee1a')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    # Install files from deb package
    cp -r --preserve=mode,timestamps opt/ "${pkgdir}/"
    cp -r --preserve=mode,timestamps usr/ "${pkgdir}/"

    # Fix permissions if needed
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/winboat/winboat" 2>/dev/null || true
}
