# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.15.g3cb0083
pkgrel=1
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('custom')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python)
makedepends=(git)
provides=(ulwgl)
conflicts=(ulwgl)
options=(!strip)
source=("git+https://github.com/Open-Wine-Components/ULWGL-launcher.git")
sha512sums=('SKIP')

pkgver() {
    cd "ULWGL-launcher"
    printf "%s" $(git describe HEAD | sed 's/-/./g')
}

check() {
    cd "ULWGL-launcher"
    export PYTHONDONTWRITEBYTECODE=1
    python gamelauncher_test.py
}

package() {
    install -dm 755 "${pkgdir}/opt/ulwgl"

    # the following script is a quick installer that is used to download & install to $HOME
    mv ULWGL-launcher/ulwgl-run-cli ULWGL-launcher/ulwgl-user-install

    mv ULWGL-launcher/* "${pkgdir}/opt/ulwgl/"
}
