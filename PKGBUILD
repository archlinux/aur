# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop-bin
_pkgname=webtorrent-desktop
pkgver=0.24.0
pkgrel=1
pkgdesc="Streaming torrent client."
arch=('x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('libnotify')
provides=('webtorrent-desktop')
conflicts=('webtorrent-desktop' 'webtorrent-desktop-git')
source=("https://github.com/webtorrent/${_pkgname}/releases/download/v${pkgver}/WebTorrent-v${pkgver}-linux-x64.zip"
        "https://github.com/webtorrent/${_pkgname}/raw/v${pkgver}/static/linux/share/applications/${_pkgname}.desktop"
        "48x48.png::https://github.com/webtorrent/${_pkgname}/raw/v${pkgver}/static/linux/share/icons/hicolor/48x48/apps/${_pkgname}.png"
        "256x256.png::https://github.com/webtorrent/${_pkgname}/raw/v${pkgver}/static/linux/share/icons/hicolor/256x256/apps/${_pkgname}.png")
sha256sums=('da12c02574aede9285a15f9d8849cdf26526fbe522f817f62ad20766303978fb'
            '8a99900eb1207d3ae278c943b95bd31a35ef8ad2fdcf3e1e664337dc176e26ec'
            'e41e7e31e3116a7c665419d79ee7242520d0305454b26edc6a792da81337c903'
            'd30ffbff61753c42239868f2d10feb89d24c6a5fc42fe5e117a5b373f7ee57b5')

prepare() {
  sed -i -e '/^Path=/d' -e "s#/opt/${_pkgname}/WebTorrent#/usr/bin/${_pkgname}#" ${_pkgname}.desktop
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-x64" "${pkgdir}/usr/share/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/WebTorrent" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -Dm644 "256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm644 "WebTorrent-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
