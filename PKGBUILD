# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=tunarr-bin
pkgver=1.0.7
pkgrel=1
pkgdesc='Create a classic TV experience using your own media - IPTV backed by Plex/Jellyfin/Emby'
arch=('x86_64' 'aarch64')
_pkgarch="x64"
[ "${CARCH}" = "aarch64" ] && _pkgarch="arm64"
url='https://tunarr.com/'
license=('zlib')
depends=(
  'ffmpeg'
  'meilisearch'
)
optdepends=(
  'plex-media-server'
  'jellyfin-server'
  'emby-server'
)
options=(!strip)
backup=('etc/conf.d/tunarr')
source=("https://github.com/chrisbenincasa/tunarr/releases/download/v${pkgver}/tunarr-${pkgver}-linux-${_pkgarch}.tar.gz"
        'tunarr.sysusers'
        'tunarr.tmpfiles'
        'tunarr.service'
        'tunarr.conf.d')
sha256sums=('85ccbe9ccd63f354b1d5adf4fc1efd8bd1b1229c716165c533ea8a5fefa13d9a'
            '85af351451b2dc90f5f611f9be8bbda076d5e1ec42276d44b7d380b1d49767a7'
            'd642c71dd83406fd659fdaed5f3ef5b44a29443a9303e8a3a912fea757571c19'
            '90e0b430bc045d2d53c3fea79633c78ce3a568778874ed71e45499868f72fbff'
            'e5ce4fc219b93fefb207b1b10b316e46fe94018cf13e25e42a5c033e9c31edb7')

package()
{
    install -Dm0755 "${srcdir}/tunarr-${pkgver}-linux-${_pkgarch}" "${pkgdir}/usr/bin/tunarr"

    install -Dm0644 "${srcdir}/tunarr.conf.d"   "${pkgdir}/etc/conf.d/tunarr"
    install -Dm0644 "${srcdir}/tunarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.service"  "${pkgdir}/usr/lib/systemd/system/tunarr.service"
}
