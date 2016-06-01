# Maintainer: gls < ghostlovescorebg at gmail dot com>

pkgname=sickrage
pkgver=4.2.5
pkgrel=3
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
depends=('python2-mako' 'python2-cheetah')
optdepends=('sabnzbd: NZB downloader'
			'transmission-cli: supported torrent client'
			'deluge: supported torrent client'
			'rtorrent: supported torrent client'
			'qbittorrent: supported torrent client'
			'python2-notify: desktop notifications (libnotify)'
			'unrar: rar extraction support'
			'git: pull new versions from git')
provides=('sickbeard-tvrage-git')
conflicts=('sickbeard' 'sickbeard-piratebay-git' 'sickbeard-tvrage-git' 'sickrage-git')
replaces=('sickbeard-tvrage-git')
options=('!strip')
install='sickrage.install'
source=("https://github.com/SiCKRAGETV/SickRage/archive/${pkgver}.tar.gz"
		'sickrage-system.service'
		'sickrage-user.service'
		'sickrage.tmpfile')

md5sums=('3c13a8468d3dfe3e7ffe2412cfe29692'
         '518016cf0c33e384b1e0977294fafa17'
         '9fdba8dda62d8205e2cfc3268f19f32f'
         'fa9ac7ae0b6c55033ef8fe5b7c83bb0f')

package() {
	mkdir -p "${pkgdir}/opt/sickrage"
	chmod 775 "${pkgdir}/opt/sickrage"
	cp -r ${srcdir}/SiCKRAGE-${pkgver}/* ${pkgdir}/opt/sickrage

	install -D -m644 sickrage-system.service "${pkgdir}/usr/lib/systemd/system/sickrage.service"
	install -D -m644 sickrage-user.service "${pkgdir}/usr/lib/systemd/user/sickrage.service"
	install -D -m644 sickrage.tmpfile "${pkgdir}/usr/lib/tmpfiles.d/sickrage.conf"

	find ${pkgdir} -type d -name '.git' -exec rm -r '{}' +
}

# vim: set ts=2 sw=2 ft=sh noet:
