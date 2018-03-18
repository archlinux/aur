# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname=plex-trakt-scrobbler
pkgver=1.3.3
pkgrel=1
pkgdesc="Add what you are watching on Plex to trakt.tv"
arch=('i686' 'x86_64')
url="https://github.com/trakt/Plex-Trakt-Scrobbler"
license=('Unknown')
depends=('plex-media-server')
source=("https://github.com/trakt/Plex-Trakt-Scrobbler/archive/v${pkgver}.tar.gz")
sha512sums=('e16c3553095897d89c4e3fa326d8a1b6edb8afd8c5111723b40981dcbb735ddab335481db8579d2f176079da760743153e7a15e5fe7fe1b173b8c947d18d7f66')

package() {
    cd "Plex-Trakt-Scrobbler-${pkgver}"
    bundle_dir="${pkgdir}/usr/lib/plexmediaserver/Resources/Plug-ins"

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
    ln -s "/usr/lib/plexmediaserver/Resources/Plug-ins/Trakttv.bundle" "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins"
    chmod a=,u=rwX,go=rX -R $pkgdir
}
