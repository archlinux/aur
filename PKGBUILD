pkgname=kwin-bismuth-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
provides=('kwin-bismuth')
conflicts=('kwin-bismuth')
options=('!emptydirs')

_archive="bismuth-bin-${pkgver}.tar.gz"

source=("${_archive}::${url}/releases/download/v${pkgver}/binary-release.tar.gz")
sha256sums=('64bfec8134f23a87a88db5f1502184b3d726558766bd4953390e9cfd1bb5a05b')
noextract=("${_archive}")

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/lib/qt" &&
        tar -C "$_" --strip-components=3 -xf "${_archive}" "./lib/x86_64-linux-gnu"

    tar -C "${pkgdir}/usr" --strip-components=1 --exclude="icon-theme.cache" -xf "${_archive}" "./share"
}
