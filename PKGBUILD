# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname=plex-trakt-scrobbler
pkgver=1.3.2
pkgrel=1
pkgdesc="Add what you are watching on Plex to trakt.tv"
arch=('i686' 'x86_64')
url="https://github.com/trakt/Plex-Trakt-Scrobbler"
license=('Unknown')
depends=('plex-media-server')
source=("https://github.com/trakt/Plex-Trakt-Scrobbler/archive/v${pkgver}.tar.gz")
sha512sums=('3b49a2abb0b4c9bef06f03116695548c412cea4491b3fa8c060e5a281d6f204c181af98a21aea93ce81b4307d301ec6bbd9b9e87f6596f180697de8273fd89ac')

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
