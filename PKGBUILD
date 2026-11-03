# Maintainer: vash909 <iu1bot@xzgroup.net>

pkgname=grappa-bin
pkgver=1.6.0
pkgrel=1
_upstream_tag=v1.6.0
_asset=grappa-1.6.0-1-x86_64.pkg.tar.zst
pkgdesc='Always-on IRC bouncer with a REST/WebSocket API and bundled cicchetto web client (official binary)'
arch=('x86_64')
url='https://github.com/vjt/grappa-irc'
license=('MIT')
depends=('bash' 'ca-certificates' 'glibc' 'libgcc' 'libstdc++' 'ncurses' 'openssl' 'systemd' 'util-linux' 'zlib')
optdepends=('shottino-bin: terminal client and IRC bridge for Grappa'
            'perl-image-exiftool: remove metadata from image uploads'
            'ffmpeg: remove metadata from video uploads'
            'nginx: HTTPS reverse proxy')
provides=("grappa=${pkgver}")
conflicts=('grappa')
options=('!strip' '!debug')
install=grappa.install
source=("${pkgname}-${_upstream_tag}-${_asset}::${url}/releases/download/${_upstream_tag}/${_asset}"
        'README.md')
noextract=("${pkgname}-${_upstream_tag}-${_asset}")
sha256sums=('6722aef456d7d3e8e996fe304c4864569279c34334664f402258a1bbbae5e3e1'
            'f40466d9862f8bf95819effdedceea8fa08f454ab179c583d53e04a85835d7a5')

package() {
    # Repackage only the upstream payload, never its pacman metadata/hooks.
    bsdtar --no-same-owner -xf "${srcdir}/${pkgname}-${_upstream_tag}-${_asset}" -C "${pkgdir}" usr
    mv "${pkgdir}/usr/share/licenses/grappa" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/grappa/AUR.md"
}
