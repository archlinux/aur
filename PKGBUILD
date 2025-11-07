# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=tunarr-bin
pkgver=0.22.12
pkgrel=1
pkgdesc='Create a classic TV experience using your own media - IPTV backed by Plex/Jellyfin/Emby'
arch=('x86_64' 'aarch64')
_pkgarch="x64"
[ "${CARCH}" = "aarch64" ] && _pkgarch="arm64"
url='https://tunarr.com/'
license=('zlib')
depends=(
  'ffmpeg'
)
optdepends=(
  'plex-media-server'
  'jellyfin-server'
  'emby-server'
)
options=(!strip)
backup=('etc/conf.d/tunarr')
source=("tunarr-${pkgver}-${_pkgarch}::https://github.com/chrisbenincasa/tunarr/releases/download/v${pkgver}/tunarr-${pkgver}-linux-${_pkgarch}"
        'tunarr.sysusers'
        'tunarr.tmpfiles'
        'tunarr.service'
        'tunarr.conf.d')
sha256sums=('9ffe1eb3729e426ea03674f3c26faa808a48c9c2c0dec4d8982b42f70e77cb0f'
            '85af351451b2dc90f5f611f9be8bbda076d5e1ec42276d44b7d380b1d49767a7'
            'd642c71dd83406fd659fdaed5f3ef5b44a29443a9303e8a3a912fea757571c19'
            'ec4c01a686ecb715ef96038e815932765b9a42fb19261062a89a932cdb8fdf85'
            'e5ce4fc219b93fefb207b1b10b316e46fe94018cf13e25e42a5c033e9c31edb7')

package()
{
    install -Dm0755 "${srcdir}/tunarr-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/tunarr"

    install -Dm0644 "${srcdir}/tunarr.conf.d"                "${pkgdir}/etc/conf.d/tunarr"
    install -Dm0644 "${srcdir}/tunarr.sysusers"              "${pkgdir}/usr/lib/sysusers.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.tmpfiles"              "${pkgdir}/usr/lib/tmpfiles.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.service"               "${pkgdir}/usr/lib/systemd/system/tunarr.service"
}
