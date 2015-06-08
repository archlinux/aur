# Maintainer: Justin Dray <justin@dray.be>

pkgname=sickrage
pkgver=4.0.22
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage and torrents support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
depends=('python2' 'python2-cheetah')
optdepends=('sabnzbd: NZB downloader'
            'python2-notify: desktop notifications'
	    'unrar: automatic decompression'
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
sha256sums=('c343e366e128209302912ea8a0e8d079407cd6d99128d0ea4674b635e04215ce'
            '468b04a3d143980c51bc5705237caff7fdd180c772081e4289ee69dd3aeb14f9'
            'c78db64732dc5f725868aea3e84f5ecc0fefef8fe7b5cbd419811929d0602714'
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
