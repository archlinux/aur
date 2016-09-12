# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname=plex-trakt-scrobbler
pkgver=1.1.0.6
pkgrel=1
pkgdesc="Add what you are watching on Plex to trakt.tv"
arch=('i686' 'x86_64')
url="https://github.com/trakt/Plex-Trakt-Scrobbler"
license=('Unknown')
depends=('plex-media-server')
source=("https://github.com/trakt/Plex-Trakt-Scrobbler/archive/v${pkgver}.tar.gz")
sha512sums=('112fcfb49ab74b31639f4951df14c7c9cba50db32ca4fdba90c7971fe0e1c6a0eec1efbc86e63d71667d7b2dcfe2a449d5f50fd456a9f6607bd4e1322af5e501')

package() {
    cd "Plex-Trakt-Scrobbler-${pkgver}"
    bundle_dir="${pkgdir}/opt/plexmediaserver/Resources/Plug-ins"

    mkdir -p $bundle_dir
    mkdir -p "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins"
    cp -r "Trakttv.bundle" $bundle_dir
    rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/"{FreeBSD,MacOSX,Windows,Android}
    rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/Linux/"{armv*,PowerPC,aarch64}
    if [ "$CARCH" == "x86_64" ]; then
        rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/Linux/i386"
    else
        rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/Linux/x86_64"
    fi
    ln -s "/opt/plexmediaserver/Resources/Plug-ins/Trakttv.bundle" "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins"
    chmod a=,u=rwX,go=rX -R $pkgdir
}
