# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>
# Many thanks to Justin Dray, maintainer of sickrage, for his PKGBUILD used as
# a base for this one.

pkgname=headphones
pkgver=0.6.0
pkgrel=1
pkgdesc="Music downloader for usenet and torrents."
arch=('any')
url="https://github.com/rembo10/headphones"
license=('GPL3')
depends=('python')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')
conflicts=('headphones-git')
options=('!strip')
install='headphones.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rembo10/headphones/archive/v${pkgver}.tar.gz"
        'headphones.service'
        'headphones.sysusers'
        'headphones.tmpfiles')

sha256sums=('e96755547b6a6cd63f2a916d4bdfd5f5a3cc62e1b89db021de441c94c064ddc6'
            '60ef2bc4c0bc1d23d4fe43202759cb24d9f456bd00cb8841ee11b2c4cbce917e'
            '348abc0627d63762a97655b5893c306e5b923857be5d0b876e9df5fea7ef9ed9'
            'ff2a4be9594518b670dafe80023772affc5e8cca85bb4c95972c7c14c72453c2')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/headphones"
  cp -a "${srcdir}/headphones-${pkgver}"/* "${pkgdir}/usr/lib/headphones"

  install -D -m 644 headphones.service "${pkgdir}/usr/lib/systemd/system/headphones.service"
  install -D -m 644 headphones.sysusers "${pkgdir}/usr/lib/sysusers.d/headphones.conf"
  install -D -m 644 headphones.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/headphones.conf"
}

# vim: set ts=2 sw=2 ft=sh noet:
