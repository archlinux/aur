# Maintainer: taotieren <admin@taotieren.com>

pkgname=sigma-file-manager
pkgver=1.7.0
pkgrel=0
pkgdesc="\"Sigma File Manager\" is a free, open-source, quickly evolving, modern file manager (explorer / finder) app for Windows and Linux."
arch=('any')
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname}-git)
replaces=()
depends=(npm)
makedepends=(git
    electron-builder)
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0cb7935e9209bea7b70f610f785e62d7e9c84dbf1961cfbbf8d0d7f9c0aaa879')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
