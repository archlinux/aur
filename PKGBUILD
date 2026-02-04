# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="yt-beats"
pkgver=0.0.16
pkgrel=1
pkgdesc="The minimal, cross-platform terminal music player for YouTube and local audio"

license=('GPL-3.0')
arch=('any')

url="https://github.com/krishnakanthb13/yt-beats"

provides=("${pkgname}")

makedepends=('sed')
depends=('bash' 'python' 'yt-dlp' 'python-requests' 'python-textual' 'python-mpv-jsonipc')

source=("${pkgname}-${pkgver}.tgz::${url}/archive//v${pkgver}.tar.gz")
sha256sums=('e04853bf4edc2992ef87fc28a6cd8ef1f1f46b8a88e9e498d016c2280db82f3f')

package() {
    cd "${pkgname}-${pkgver}/" || return 1

    sed -i '2s/$/\ncd "$(dirname "$(realpath -- "$0")")"\n/' "YT-Beats.sh"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -rf ./* "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/opt/${pkgname}/YT-Beats.sh"
    ln -sf "/opt/${pkgname}/YT-Beats.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    ln -sf "/opt/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sf "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
