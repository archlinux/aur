# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=simple-torrent-bin
_pkgname=simple-torrent
pkgdesc="Simple Torrent: a self-hosted remote torrent client (rebranded from Cloud Torrent)"
pkgver=1.3.3
pkgrel=1
arch=( 'x86_64' 'aarch64' )
url='https://github.com/boypt/simple-torrent'
license=( 'GPL3' )

source=(
  simple-torrent.gz::https://github.com/boypt/simple-torrent/releases/download/${pkgver}/cloud-torrent_linux_amd64_static.gz
  simple-torrent.sysusers
  simple-torrent.tmpfiles
  simple-torrent.service
  simple-torrent.env
)

install="simple-torrent.install"
backup=( 'etc/simple-torrent.conf' )

sha256sums=(
  '4fc6c7ddfa35045b0604e38bbf8fd0ea2e9716b8ba468149da63ce977028fec1'
  'e2660e2d20550154bab3b4bbc3bc857516a059346f8217773b6cb00d12511eb4'
  'e1a6099ca9693e2004d3a67ab875c771ec1101f8539f44246f935e663492bd33'
  '8ae649da3a4622be3bbd4f413c2cea3bea5c492efadb3682ee55e2265193924a'
  '7132ed3c257b2c912fe7e707eb60f9dc6f34435ef7521ce33a4a192addeafc3d'
)

prepare() {
  gunzip -c ${_pkgname}.gz > ${_pkgname}
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.env"      "${pkgdir}/etc/${_pkgname}.conf"

  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/simple-torrent"
}
