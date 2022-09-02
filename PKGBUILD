pkgname=kwin-bismuth-bin
pkgver=3.1.3
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
sha256sums=('bd5f1a13db2fcbe6a9fc6a3260ce4add3aa281a09eb2952b36d340fde1f1b9c6')
noextract=("${_archive}")

package() {
    cd "${srcdir}"
    local qt="${pkgdir}/usr/lib/qt"
    install -dm755 "${qt}"
    tar -C "${qt}" --strip-components=3 -xf "${_archive}" "./lib/x86_64-linux-gnu"
    tar -C "${pkgdir}/usr" --strip-components=1 --exclude="icon-theme.cache" -xf "${_archive}" "./share"
}
