# Maintainer: Neroices <git@slce.moe>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=BKSalman
_basename=ytdlp-gui
pkgname=${_basename}-bin
pkgver=3.4.1
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
            '55572893d05ab570938fbf8039f67e44b8d63b15e7fa86cac35a79dcb0738596')
sha256sums_x86_64=('adabaea62b73b5c4eec9b5271f8e9bfc97fa0f6118ac778556046c4bf1c5c2cd')

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
