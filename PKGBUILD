# Maintainer: Neroices <git@slce.moe>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=BKSalman
_basename=ytdlp-gui
pkgname=${_basename}-bin
pkgver=3.5.1
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
            'c02244cfa67f413274035beca19f8c1e2e50b87fa4bffff4f78622dc8f062a38'
            '2db6630f01e2fa9b6772012224c95cefe8606aeeed1e51e2bbd408d2573d9314')
sha256sums_x86_64=('39126ead80fe1b892af0edc13fa423914c587e95ab0c9d0b4c6fd43de54808e8')

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
