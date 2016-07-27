# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname=plex-trakt-scrobbler
pkgver=1.0.3.3
pkgrel=1
pkgdesc="Add what you are watching on Plex to trakt.tv"
arch=('i686' 'x86_64')
url="https://github.com/trakt/Plex-Trakt-Scrobbler"
license=('Unknown')
depends=('plex-media-server')
source=("https://github.com/trakt/Plex-Trakt-Scrobbler/archive/v${pkgver}.tar.gz")
sha512sums=('0d6fa6e97b060efe4c1248cde83a691bbbca0141f0d960c2157e6a6ca11c5212e906b1b7a0ea0ad58fe021e3ffff0ab6396e69b7152f99bf42c1743e036d4ebd')

package() {
    cd "Plex-Trakt-Scrobbler-${pkgver}"
    bundle_dir="${pkgdir}/opt/plexmediaserver/Resources/Plug-ins"

    mkdir -p $bundle_dir
    mkdir -p "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins"
    cp -r "Trakttv.bundle" $bundle_dir
    rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/"{FreeBSD,MacOSX,Windows}
    rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/Linux/"{armv*,PowerPC}
    if [ "$CARCH" == "x86_64" ]; then
        rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/Linux/i386"
    else
        rm -rf "${bundle_dir}/Trakttv.bundle/Contents/Libraries/Linux/x86_64"
    fi
    ln -s "/opt/plexmediaserver/Resources/Plug-ins/Trakttv.bundle" "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins"
    chmod a=,u=rwX,go=rX -R $pkgdir
}
