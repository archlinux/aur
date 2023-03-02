# Maintainer: zhullyb < zhullyb [at] outook dot com >
# Maintainer: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-liupan1890
url="https://github.com/odomu/aliyunpan"
pkgrel=1
pkgver=3.10.24.git03b0319
pkgdesc="阿里云盘小白羊版，临时更换为 odomu 修复下载的 fork"
arch=("any")
license=("None")
_electron=electron20
depends=(${_electron} 'aria2')
makedepedns=('yarn')
optdepends=('mpv: media preview support')
source=("git+${url}.git#tag=03b0319c29d26c47000b17d776c758a33d8a9515"
		'aliyunpan-liupan1890.sh'
		'aliyunpan-liupan1890.desktop'
		'app.png'
)
sha256sums=('SKIP'
            '9e28674e188846b10fac60bc3cb88bce4059c151b7d27a5a1bb4603ad0540469'
            '8e726be3f880df102990241b6af8b503d37cc3345971191d0222ed9851df8426'
            '2847ab9e9c9cea5fbee331dd34abc8a8cebef232dcfb4f739da7a36d9bed4c79')
prepare(){
	sed -i "s|@ELECTRON@|${_electron}|" aliyunpan-liupan1890.sh
}

build(){
	cd ${srcdir}/aliyunpan
	yarn
	yarn run build --linux dir
}

package(){
	install -Dm644 ${srcdir}/aliyunpan/release/linux-unpacked/resources/app.asar -t ${pkgdir}/usr/lib/aliyunpan-liupan1890/
	cp -a ${srcdir}/aliyunpan/release/linux-unpacked/resources/crx/ ${pkgdir}/usr/lib/aliyunpan-liupan1890/
	mkdir -p ${pkgdir}/usr/lib/aliyunpan-liupan1890/engine/linux/
	ln -s /usr/bin/aria2c ${pkgdir}/usr/lib/aliyunpan-liupan1890/engine/linux/

	install -Dm644 ${srcdir}/app.png -t ${pkgdir}/usr/lib/aliyunpan-liupan1890/
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/
	ln -s /usr/lib/aliyunpan-liupan1890/app.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/aliyunpan-liupan1890.png
	install -Dm644 ${srcdir}/aliyunpan-liupan1890.desktop -t ${pkgdir}/usr/share/applications/
	install -Dm755 ${srcdir}/aliyunpan-liupan1890.sh ${pkgdir}/usr/bin/aliyunpan-liupan1890
}
