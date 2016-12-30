# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname=plex-trakt-scrobbler
pkgver=1.3.0
pkgrel=1
pkgdesc="Add what you are watching on Plex to trakt.tv"
arch=('i686' 'x86_64')
url="https://github.com/trakt/Plex-Trakt-Scrobbler"
license=('Unknown')
depends=('plex-media-server')
source=("https://github.com/trakt/Plex-Trakt-Scrobbler/archive/v${pkgver}.tar.gz")
sha512sums=('5b745f7bc471b2cd1c69c10c370b85e7a3c5147c0b89794b872bee261d6b52d50d6831b437d4f8bf896cd1a652e4f835dc0d1706a3554011f19dd4b2ca33dfc2')

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
