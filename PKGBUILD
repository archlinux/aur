# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=jellyfin-server-bin
pkgver="10.6.0_2"
_pkgver=$(echo "$pkgver" | cut -f1 -d"_")
_pkgverfull="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin-server')
conflicts=('jellyfin-server' 'jellyfin-server-git')
depends=('ffmpeg' 'jellyfin-web')
optdepends=('ffmpeg-mmal: OpenMAX OMX hardware acceleration on Raspberry Pis')
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
sha256sums_x86_64=('abfaefb526daacf1a14e930abf41a33afed05212adadc18b5262589cf7505986')
sha256sums_aarch64=('23ffbb221eeba390c8889a9f70130296a535b7b8889d3ec5b14c8802a6b7df8f')
sha256sums_armv7h=('23503c3debf45e36c3800d06f9522e57801c58ab947529a8f25606c53038456a')

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
