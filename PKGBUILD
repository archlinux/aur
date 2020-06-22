# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: erbridge <f@erbridge.co.uk>
pkgname=amulet
pkgver=1.21.9
pkgrel=1
pkgdesc="Lua-based audio / visual toolkit for small-scope games and experimentation"
arch=('x86_64')
url="http://www.amulet.xyz/"
license=('MIT')
depends=('gcc-libs-multilib')
source=("https://github.com/ianmaclarty/amulet/releases/download/v${pkgver}/amulet-v${pkgver}-linux.zip")
md5sums=('322a76bea3bba24162a16b3f743ea699')
options=('!strip')

package() {
    cd "amulet-v${pkgver}"

    install -d -m755 "${pkgdir}/usr/share/${pkgname}/builds"
    cp -r builds/* "${pkgdir}/usr/share/${pkgname}/builds"
    find "${pkgdir}/usr/share/${pkgname}/builds" -type f -print0 | xargs -0 chmod 0644
    find "${pkgdir}/usr/share/${pkgname}/builds" -type d -print0 | xargs -0 chmod 0755

    install -D -m755 amulet "${pkgdir}/usr/share/${pkgname}/amulet"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/amulet" "${pkgdir}/usr/bin/${pkgname}"

    install -D -m644 amulet_license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
