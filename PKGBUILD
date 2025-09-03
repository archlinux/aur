# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=BKSalman
_basename=ytdlp-gui
pkgname=${_basename}-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="a GUI for yt-dlp written in Rust"
arch=('x86_64')
url="https://github.com/${_author}/${_basename}"
_urlraw="https://raw.githubusercontent.com/${_author}/${_basename}/v${pkgver}"
license=('GPL-3.0-only')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'glib2' 'gtk3' 'gcc-libs' 'hicolor-icon-theme' 'yt-dlp' 'ffmpeg')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'd2eee9ca79897795723f8b12e60feb711c267bd125b9dbc1adf1c9b4a8fab35e'
            '89ba0749a377a941296019efa663742977e50175c1b48f70139631936115410f')
sha256sums_x86_64=('eb95078e6b52f982b624e80660aa3445abf7cda9c992d342045f806a7d186cca')

package() {
    cd "${srcdir}" || return 1

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    cd "${pkgdir}" || return 1

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"

    # fix icon
    install -Dm644 "${pkgdir}/usr/share/icons/hicolor/ytdlp-gui.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ytdlp-gui.png"
    rm -rf "${pkgdir}/usr/share/icons/hicolor/ytdlp-gui.png"
} 
