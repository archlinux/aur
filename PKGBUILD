# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Rob Lynn <rob22uk at gmail dot com>

pkgname=stremio-legacy
pkgver=3.6.5
pkgrel=3
pkgdesc='A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels) (legacy version)'
arch=('x86_64')
url='https://www.stremio.com/'
depends=('ffmpeg' 'gconf' 'gtk2' 'nss')
license=('custom')
options=('!strip')
source=("https://strem.io/Stremio${pkgver}.linux.tar.gz"
        'https://strem.io/favicon-32x32.png'
        'https://strem.io/favicon-96x96.png'
        'stremio.desktop')
noextract=("Stremio${pkgver}.linux.tar.gz")
sha256sums=('8ea9fc21543e30c773adbcfac3759e8787de315ac25e2da7f8580cb670f68424'
            'd41058548c2505c476955e2e9bbfe0b14d0c76198147b3364343f5a1b2a1e702'
            '3633a9ca3a3584037e90b1203d2fd2987180c5ab949682a2db6bfbcfa9852a9d'
            'f2c463d046ba329912869057e2dcda37825e8fcc59b01e46c591665a4b22c605')

prepare() {
    mkdir -p "stremio-${pkgver}"
    cd "stremio-${pkgver}"
    bsdtar -xf ../"Stremio${pkgver}.linux.tar.gz"
    
    sed -i "s#\$(dirname \$0)#/usr/share/stremio#" Stremio.sh
}

package() {
    cd "stremio-${pkgver}"
    
    install -d -m755 "${pkgdir}/usr/share/stremio"
    
    install -D -m755 Stremio.sh "${pkgdir}/usr/bin/stremio"
    
    install -D -m644 content_shell.pak "${pkgdir}/usr/share/stremio/"
    install -D -m644 icudtl.dat        "${pkgdir}/usr/share/stremio/"
    install -D -m644 libgcrypt.so.11   "${pkgdir}/usr/share/stremio/"
    install -D -m644 libnode.so        "${pkgdir}/usr/share/stremio/"
    install -D -m644 libnotify.so.4    "${pkgdir}/usr/share/stremio/"
    install -D -m644 natives_blob.bin  "${pkgdir}/usr/share/stremio/"
    install -D -m644 snapshot_blob.bin "${pkgdir}/usr/share/stremio/"
    install -D -m755 Stremio-runtime   "${pkgdir}/usr/share/stremio/"
    install -D -m644 version           "${pkgdir}/usr/share/stremio/"
    
    cp -a locales   "${pkgdir}/usr/share/stremio/"
    cp -a resources "${pkgdir}/usr/share/stremio/"
    cp -a WCjs      "${pkgdir}/usr/share/stremio/"
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    cd "${srcdir}"
    install -D -m644 stremio.desktop   "${pkgdir}/usr/share/applications/stremio.desktop"
    install -D -m644 favicon-32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/stremio.png"
    install -D -m644 favicon-96x96.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/stremio.png"
}
