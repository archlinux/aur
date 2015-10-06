# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=sickrage
pkgver=4.0.73.1
pkgrel=1
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
source=("https://github.com/SiCKRAGETV/SickRage/archive/v${pkgver}.tar.gz"
		'sickrage-system.service'
		'sickrage-user.service'
		'sickrage.tmpfile')
sha256sums=('e4654492f657d30e181fec66f3394d9a6f96bb09e4c38d0126831bad3ca81d19'
			'1c972f6b27b7095d241580f1992682cd08d640f5692c201f2bd57823635da9dd'
			'98f3df9ef1c85fb110286c3a1a7d8c9fb20ef587b11d739428b75626d4e03000'
			'7fbf425e4ef14345e9a91c098c6f1a9cb6ddaed2617b04160a47d35747083565')

package() {
	mkdir -p "$pkgdir/opt/sickrage"
	chmod 775 "$pkgdir/opt/sickrage"
	cp -r SickRage-${pkgver}/* "$pkgdir/opt/sickrage"

	install -D -m644 sickrage-system.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
	install -D -m644 sickrage-user.service "$pkgdir/usr/lib/systemd/user/sickrage.service"
	install -D -m644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"

	find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim: set ts=2 sw=2 ft=sh noet:
