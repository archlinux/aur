pkgname=kwin-bismuth-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_base="${pkgname%-bin}"
_name="${_base#kwin-}"
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
provides=("${_base}")
conflicts=("${_base}")
options=('!emptydirs')

_archive="${_name}-bin-${pkgver}.tar.gz"

source=("${_archive}::${url}/releases/download/v${pkgver}/binary-release.tar.gz")
sha256sums=('ca7c2b6b248a07bae7412822b24a295ba12bb51954cfdf26d002be7568b2d223')
noextract=("${_archive}")

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/lib/qt" &&
        tar -C "$_" --strip-components=3 -xf "${_archive}" "./lib/x86_64-linux-gnu"

    tar -C "${pkgdir}/usr" --strip-components=1 --exclude="icon-theme.cache" -xf "${_archive}" "./share"
}
