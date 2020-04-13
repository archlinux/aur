# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-bin
pkgver=10.5.4
_pkgver="$pkgver-1"
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://jellyfin.org/'
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
sha256sums_x86_64=('728e17a0fbb1874983d9f5466a189aff54102534be3474e782dda072b5d368aa')
sha256sums_aarch64=('fa5eee9827c9e41a04f22e008376cd8096e952a3e3c823c0a959c86e772e5049')
sha256sums_armv7h=('f04fbe1e1c85d4b73e54a209409026c7d42a3608c17c63b0c039fd2ff0761ce7')

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
