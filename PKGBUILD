# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-server-bin
pkgver="10.6.4_1"
_pkgver=$(echo "$pkgver" | cut -f1 -d"_")
_pkgverfull="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Free Software Media System - server package'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin-server')
conflicts=('jellyfin-server' 'jellyfin-server-git')
depends=('ffmpeg')
optdepends=('ffmpeg-mmal: OpenMAX OMX hardware acceleration on Raspberry Pis'
	    'jellyfin-web: Web interface')
source=('jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
source_x86_64=("https://repo.jellyfin.org/releases/server/debian/versions/stable/server/${_pkgver}/jellyfin-server_${_pkgverfull}_amd64.deb")
source_aarch64=("https://repo.jellyfin.org/releases/server/debian/versions/stable/server/${_pkgver}/jellyfin-server_${_pkgverfull}_arm64.deb")
source_armv7h=("https://repo.jellyfin.org/releases/server/debian/versions/stable/server/${_pkgver}/jellyfin-server_${_pkgverfull}_armhf.deb")
sha256sums=('1ea19635cced6672484937903c27976a5a145d708caff06a687a8defdd23d549'
            '0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a')
sha256sums_x86_64=('7b30f1b78e641a7e0b87481410772fef19d8a5d7859124e078402d99cc10bbd9')
sha256sums_aarch64=('12b1485e2bd8b8a1c88a9040425ce2728572d12610a5594b96acc4b0904de223')
sha256sums_armv7h=('a7350f3ed34bcc0aeeadfc94e244a0224627977d6b737fc7da29340dcf7eaea2')

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
