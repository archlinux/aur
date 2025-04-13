# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=tunarr-bin
pkgver=0.18.17
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
sha256sums=('b4d0d5c977a92ce475f041dbb36be6a45a88d8c3f9d1993ae294bb09017fd455'
            '4d4375c6326db6d4738b86ddfc114d16b1f4804dece0f053450abce49d55e78c'
            'b2d15cf310c96457775c428e7e6ae7a7cf1cf5c5874d95414934087613b3539d'
            '64755e37e633ead21017f81ede2462603952906000c1987b85f02a663d70ac75'
            'e5ce4fc219b93fefb207b1b10b316e46fe94018cf13e25e42a5c033e9c31edb7')

package()
{
    install -Dm0755 "${srcdir}/tunarr-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/tunarr"

    install -Dm0644 "${srcdir}/tunarr.conf.d"                "${pkgdir}/etc/conf.d/tunarr"
    install -Dm0644 "${srcdir}/tunarr.sysusers"              "${pkgdir}/usr/lib/sysusers.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.tmpfiles"              "${pkgdir}/usr/lib/tmpfiles.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.service"               "${pkgdir}/usr/lib/systemd/system/tunarr.service"
}
