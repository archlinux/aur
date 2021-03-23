# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=jellyfin-server-bin
pkgver=10.7.1
_pkgver="${pkgver}-1"
pkgrel=3
pkgdesc='Jellyfin server component'
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
source_x86_64=("https://repo.jellyfin.org/releases/server/debian/stable/server/jellyfin-server_${_pkgver}_amd64.deb")
source_aarch64=("https://repo.jellyfin.org/releases/server/debian/stable/server/jellyfin-server_${_pkgver}_arm64.deb")
source_armv7h=("https://repo.jellyfin.org/releases/server/debian/stable/server/jellyfin-server_${_pkgver}_armhf.deb")
sha256sums=('1ea19635cced6672484937903c27976a5a145d708caff06a687a8defdd23d549'
            '0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a')
sha256sums_x86_64=('c6a38f72ee9fc213ddd35cbaedbe3c54c2ac81febdeb14a8df105e7c0ce32e79')
sha256sums_aarch64=('bd303b3f6afaabb7fc7dca43af99656b7e031a8672fc1131605b8ca2b943f6f1')
sha256sums_armv7h=('f51a7b60f94c2680cea3524c7ce8c1390638826bef94a4b09e1bc24bd77e5d6c')
backup=('etc/conf.d/jellyfin')
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
