# Maintainer: Rohan Ferris <rohan@goferris.net>
# Helpful URL: https://github.com/rogerfar/rdt-client

pkgname='rdt-client'
pkgver=2.0.89
pkgrel=1
pkgdesc='Real-Debrid Torrent Client'
arch=(any)
url='https://github.com/rogerfar/rdt-client'
license=('MIT')

makedepends=(
    'unzip'
)

depends=(
    'dotnet-runtime-bin'
    'aspnet-runtime-bin'
)

optdepends=(
    'aria2: download utility'
)

source=(
    "https://github.com/rogerfar/rdt-client/releases/download/v${pkgver}/RealDebridClient.zip"
    'appsettings.json'
    'rdtc.service'
    'rdtc.sysusers'
    'rdtc.tmpfiles'
)

noextract=('RealDebridClient.zip')
sha512sums=('f81ab5baf1b9686e5c5b5cc443288c485abc264fd418501f17f045ad04d3bfde4a56e7635c3ab547465acc0486426a1de1d133cad45cad29e18a3132c6b920b9'
            '526154379ef5972bac6db1d170d6f4c68f06c720ff70f355d7ba7fdb8208c549880fa1378eb3db3e358f02383b44240060ceb2ceb312bd24afffb88864960261'
            '67330f3202bf1696d706c297b7121a267a1b17064b167fea134ed76162bd1e42355970068f950b8ede7eb4a822f49825ece8b95b132087a3397645480545d312'
            '67a6587c3eb4953fcce2d329d71a15739c536bdf928d14db7d9cae5ecb63c913e6a05841f4207f0f72dd896c4b6937ed690ea340d83440b0eb92b3ca34609071'
            'fd6499d74aaf238ffceeda6ed3e63d6ac90893a3deed65df024946932f194a7543c1831edf372b519e7e754f5a5f6caf8a0e5298e7f5eebfc161009081e70418')

package() {
    # binaries
    install -d -m 755 "${pkgdir}/usr/lib/rdtc"
    unzip "${srcdir}/RealDebridClient.zip" -d "${pkgdir}/usr/lib/rdtc"
    install -D -m 644 "${srcdir}/appsettings.json" "${pkgdir}/usr/lib/rdtc"

    # app data
    install -d -m 755 "${pkgdir}/var/lib/rdtc/db"
    install -d -m 755 "${pkgdir}/var/lib/rdtc/logs"

    # system files
    install -D -m 644 "${srcdir}/rdtc.service" "${pkgdir}/usr/lib/systemd/system/rdtc.service"
    install -D -m 644 "${srcdir}/rdtc.sysusers" "${pkgdir}/usr/lib/sysusers.d/rdtc.conf"
    install -D -m 644 "${srcdir}/rdtc.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/rdtc.conf"
}
