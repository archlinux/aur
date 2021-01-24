# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-server-bin
pkgver='10.7.0~rc3'
_pkgver=$(echo "$pkgver" | cut -f1 -d"_")
_pkgverfull="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Free Software Media System - server package'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin-server')
conflicts=('jellyfin-server' 'jellyfin-server-git')
depends=("ffmpeg" "jellyfin-web-bin>=$pkgver")
optdepends=('ffmpeg-mmal: OpenMAX OMX hardware acceleration on Raspberry Pis')
source=('jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
# Switch from 'stable-rc' to 'stable' ASAP when RC packages goes to stable. Since when RC packages considered 'stable' in the first place?
source_x86_64=("https://repo.jellyfin.org/releases/server/debian/versions/stable-rc/server/${_pkgver}/jellyfin-server_${_pkgverfull}_amd64.deb")
source_aarch64=("https://repo.jellyfin.org/releases/server/debian/versions/stable-rc/server/${_pkgver}/jellyfin-server_${_pkgverfull}_arm64.deb")
source_armv7h=("https://repo.jellyfin.org/releases/server/debian/versions/stable-rc/server/${_pkgver}/jellyfin-server_${_pkgverfull}_armhf.deb")
sha256sums=('1ea19635cced6672484937903c27976a5a145d708caff06a687a8defdd23d549'
            '0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a')
sha256sums_x86_64=('5e759a913bb051d844d95d12c82ca405732de4ca24d5fd180b6ec6c0a7aebd13')
sha256sums_aarch64=('f84425f0b75c7379c0f4dae2c3531a867a2ea96893e0370aaf582b0553244b93')
sha256sums_armv7h=('8baec13440fdc6b7d05227d560a73cffa6b44467a5b1b38351da88bcdbbbb00a')

options=('staticlibs')

package() {
	tar -xf data.tar.xz

	cp -r "$srcdir"/usr "$pkgdir"/usr
	rm -r "$pkgdir"/usr/share
	
	install -Dm 644 jellyfin.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm 644 jellyfin.sysusers "$pkgdir"/usr/lib/sysusers.d/jellyfin.conf
	install -Dm 644 jellyfin.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/jellyfin.conf
	install -Dm 644 jellyfin.conf "$pkgdir"/etc/conf.d/jellyfin
}
