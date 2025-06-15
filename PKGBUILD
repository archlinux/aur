# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=BKSalman
_basename=ytdlp-gui
pkgname=${_basename}-bin
pkgver=3.0.1
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
            '800643979e36f17c78cb43871e071e0b1b8f23c6067fded9bbb8aa515b952faf'
            '801ca6377763438ee69246ff96977eda75a616eddb62698446a207dec2c0f310')
sha256sums_x86_64=('e6a23262636828ba0b324b466539d8e8a5d95ffb0aadf7287a500160ce336215')

package() {
    cd "${srcdir}" || return 1

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    cd "${pkgdir}" || return 1

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
} 
