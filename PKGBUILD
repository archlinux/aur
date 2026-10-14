# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=shottino-bin
pkgver=0.3.1
pkgrel=1
# Shottino has its own version, independent of the containing Grappa release.
_upstream_tag=v1.5.14
_asset=shottino-0.3.1-1-x86_64.pkg.tar.zst
pkgdesc='Terminal client and IRC bridge for Grappa with an ncurses interface (official binary)'
arch=('x86_64')
url='https://github.com/vjt/grappa-irc'
license=('MIT')
depends=('ca-certificates' 'glibc' 'ncurses' 'openssl')
optdepends=('grappa-bin: run a local Grappa server'
            'ffmpeg: inline image, video and GIF previews'
            'chafa: enhanced terminal image rendering'
            'xdg-utils: open links in external applications')
provides=("shottino=${pkgver}")
conflicts=('shottino')
options=('!strip' '!debug')
source=("${pkgname}-${_upstream_tag}-${_asset}::${url}/releases/download/${_upstream_tag}/${_asset}"
        'README.md')
noextract=("${pkgname}-${_upstream_tag}-${_asset}")
sha256sums=('399d1eebd4c8a9cd2b021f234314bb8d0269c3b4bbcf2c1ad0719d660185b7ae'
            '9e10e292cb2f14c8bb99fcbf5c65c20b7309d6ee8655a3a8d3212c38a1fdb8e6')

package() {
    bsdtar --no-same-owner -xf "${srcdir}/${pkgname}-${_upstream_tag}-${_asset}" -C "${pkgdir}" usr
    mv "${pkgdir}/usr/share/licenses/shottino" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/shottino/README.md"
}
