# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname=tuyapi-cli
pkgver=1.18.3
pkgrel=2
pkgdesc="A CLI for Tuya devices."
arch=('any')
url="https://github.com/TuyaAPI/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('f4d484c82a56255225b6c1c3a92b048d53e357c306c0699847bb0c1eccf5953e')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/lib/node_modules/@tuyapi/cli/LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/"
}
