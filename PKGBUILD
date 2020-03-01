# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-bin
pkgver=10.4.3
_pkgver="$pkgver-1"
pkgrel=2
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
# Sources can also be used from https://github.com/jellyfin/jellyfin/releases
source_x86_64=("https://repo.jellyfin.org/releases/server/debian/versions/${pkgver}/jellyfin_${_pkgver}_amd64.deb")
source_aarch64=("https://repo.jellyfin.org/releases/server/debian/versions/${pkgver}/jellyfin_${_pkgver}_arm64.deb")
source_armv7h=("https://repo.jellyfin.org/releases/server/debian/versions/${pkgver}/jellyfin_${_pkgver}_armhf.deb")
sha256sums=('9f8dafb06676f972fca88cc1cedf5936518b5a7556628482aeea2c7f2f485678'
            '0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a')
sha256sums_x86_64=('280ed014e11247bafa38a75819bf65872f40c127e1814138963b1d1ed1060b14')
sha256sums_aarch64=('5ed67317f12d55b83c547319ee30cc2e8c3aa4103967115a1171237a9d7ef388')
sha256sums_armv7h=('83c767663a7ccfb518900854fa3ab7b2550904fe7757ead29d93e71840cbbd86')

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
