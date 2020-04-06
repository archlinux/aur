# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-bin
pkgver=10.5.3
_pkgver="$pkgver-1"
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/jellyfin/jellyfin'
license=('GPL2')
provides=('jellyfin')
conflicts=('jellyfin' 'jellyfin-git')
depends=('ffmpeg' 'sqlite')
optdepends=('ffmpeg-mmal: OpenMAX OMX hardware acceleration on Raspberry Pis')
source=('jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
#source_x86_64=("https://repo.jellyfin.org/releases/server/debian/versions/${pkgver}/jellyfin_${_pkgver}_amd64.deb")
#source_aarch64=("https://repo.jellyfin.org/releases/server/debian/versions/${pkgver}/jellyfin_${_pkgver}_arm64.deb")
#source_armv7h=("https://repo.jellyfin.org/releases/server/debian/versions/${pkgver}/jellyfin_${_pkgver}_armhf.deb")
source_x86_64=("https://github.com/jellyfin/jellyfin/releases/download/v${pkgver}/jellyfin_${_pkgver}_debian-amd64.deb")
source_aarch64=("https://github.com/jellyfin/jellyfin/releases/download/v${pkgver}/jellyfin_${_pkgver}_debian-arm64.deb")
source_armv7h=("https://github.com/jellyfin/jellyfin/releases/download/v${pkgver}/jellyfin_${_pkgver}_debian-armhf.deb")
sha256sums=('9f8dafb06676f972fca88cc1cedf5936518b5a7556628482aeea2c7f2f485678'
            '0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a')
sha256sums_x86_64=('33829e57a8db2e41ca7f937128e24c37a60dbd0f9ddf46e3900c3dbf963bb221')
sha256sums_aarch64=('094952f87ec62d0e11cbccd77d70c7124e487057edef627a1be1a5d2d5152c2a')
sha256sums_armv7h=('f0b487df3b37fbfb77a7b906b31318739f6a2f93157578b052b58484f88b987c')

options=('staticlibs')

package() {
	tar -xf data.tar.xz

	cp -r -fHip "$srcdir"/usr "$pkgdir"/usr
	rm -r "$pkgdir"/usr/share
	
	install -Dm 644 jellyfin.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm 644 jellyfin.sysusers "$pkgdir"/usr/lib/sysusers.d/jellyfin.conf
	install -Dm 644 jellyfin.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/jellyfin.conf
	install -Dm 644 jellyfin.conf "$pkgdir"/etc/conf.d/jellyfin
}
