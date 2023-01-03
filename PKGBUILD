# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>
# Many thanks to Justin Dray, maintainer of sickrage, for his PKGBUILD used as
# a base for this one.

pkgname=headphones-git
pkgver=0.6.0.r0.ga78f38c1
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
makedepends=('git')
provides=('headphones')
conflicts=('headphones')
options=('!strip')
install='headphones.install'
source=('git+https://github.com/rembo10/headphones.git'
        'headphones.service'
        'headphones.sysusers'
        'headphones.tmpfiles')

sha256sums=('SKIP'
            '60ef2bc4c0bc1d23d4fe43202759cb24d9f456bd00cb8841ee11b2c4cbce917e'
            '348abc0627d63762a97655b5893c306e5b923857be5d0b876e9df5fea7ef9ed9'
            'ff2a4be9594518b670dafe80023772affc5e8cca85bb4c95972c7c14c72453c2')

pkgver() {
  cd "${srcdir}/headphones"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/headphones"
  cp -a "${srcdir}/headphones"/* "${pkgdir}/usr/lib/headphones"
  rm -rf "${pkgdir}/usr/lib/headphones/.git"

  install -D -m 644 headphones.service "${pkgdir}/usr/lib/systemd/system/headphones.service"
  install -D -m 644 headphones.sysusers "${pkgdir}/usr/lib/sysusers.d/headphones.conf"
  install -D -m 644 headphones.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/headphones.conf"
}

# vim: set ts=2 sw=2 ft=sh noet:
