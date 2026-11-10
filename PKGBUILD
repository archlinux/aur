# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=tunarr-bin
pkgver=2026.11.2
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
install=tunarr.install
backup=('etc/conf.d/tunarr')
source=("https://github.com/chrisbenincasa/tunarr/releases/download/v${pkgver}/tunarr-v${pkgver}-linux-${_pkgarch}.tar.gz"
        'tunarr.sysusers'
        'tunarr.tmpfiles'
        'tunarr.service'
        'tunarr.conf.d')
sha256sums=('0a6f81c7f1c289ab5bc05a54913223cc63ba3fb102fa10e73e536fd38fcb7500'
            '85af351451b2dc90f5f611f9be8bbda076d5e1ec42276d44b7d380b1d49767a7'
            'd642c71dd83406fd659fdaed5f3ef5b44a29443a9303e8a3a912fea757571c19'
            'b48e6580bd86be9d83acc1b45dc5957d2374c1a37bca2a8223f790c9203a7604'
            'e5ce4fc219b93fefb207b1b10b316e46fe94018cf13e25e42a5c033e9c31edb7')

package()
{
    install -Dm0755 "${srcdir}/tunarr-v${pkgver}-linux-${_pkgarch}/tunarr"           "${pkgdir}/usr/bin/tunarr"
    install -Dm0755 "${srcdir}/tunarr-v${pkgver}-linux-${_pkgarch}/meilisearch"      "${pkgdir}/usr/bin/tunarr-meilisearch"
    install -Dm0755 "${srcdir}/tunarr-v${pkgver}-linux-${_pkgarch}/ersatztv-channel" "${pkgdir}/usr/bin/tunarr-ersatztv"

    install -Dm0644 "${srcdir}/tunarr.conf.d"   "${pkgdir}/etc/conf.d/tunarr"
    install -Dm0644 "${srcdir}/tunarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tunarr.conf"
    install -Dm0644 "${srcdir}/tunarr.service"  "${pkgdir}/usr/lib/systemd/system/tunarr.service"
}
