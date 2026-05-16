# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=BKSalman
_basename=ytdlp-gui
pkgname=${_basename}-bin
pkgver=3.3.0
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
    'fc06ff461f6c1f5dcaa794254355b5d1009d51f88835a6b5f62f8a587e01c90c'
    '7799191a616d5786d2ec28df02f48b78e84f9df0aaa021696f085527d4617180')
sha256sums_x86_64=('721b7e3ef700cb95fd4ca2148f5dcc4c6d0194df8c2593bc170e41cb85dc6007')

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
