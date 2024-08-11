# Maintainer: ShoreNinth <shoreninth@outlook.com>

pkgname=pgyvisitor
_pkgname=PgyVisitor
pkgver=6.2.0
pkgrel=1
pkgdesc="贝锐蒲公英客户端 Oray Pgy Visitor"
arch=("x86_64" "i686" "aarch64" "armv7h")
url="https://pgy.oray.com"
license=('custom')
options=("!strip" "!debug")

source=('LICENSE::https://service.oray.com/question/1820.htm')
source_x86_64=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2156/$_pkgname$pkgver_x86_64.deb")
source_i686=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2156/$_pkgname$pkgver_i386.deb")
source_aarch64=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2156/$_pkgname$pkgver_arm64.deb")
source_armv7h=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2156/$_pkgname$pkgver_arm32.deb")

sha256sums=('SKIP')
sha256sums_x86_64=('e062a592f1f127fa589f6919b3c6e96b71e403854d22d30d75b2cd753c45f2bc')
sha256sums_i686=('a68066fa0b910a4dba6766c6a4d75807daa33ab3ebe9bfe9b093aee907d46705')
sha256sums_aarch64=('4b71ac53e7f87ff49e1b9b7aa3d3499fa6f2b56679d27a368dd5a19f32d1df66')
sha256sums_armv7h=('94fadf907b9f0376e35c6de2d2ae019ff06be9b5848856022f1c58075a9f98ff')

prepare() {
	cd "${srcdir}"
	bsdtar -xpf $_pkgname-$pkgver.deb
}

package() {

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	tar -xf data.tar.xz -C ${pkgdir}
	mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin

	rm -d ${pkgdir}/etc/init.d
	chmod 755 ${pkgdir}/{etc,usr}

#   chmod +x ${pkgdir}/usr/share/pgyvpn/script/pgyvpn_monitor
	chmod +x ${pkgdir}/usr/share/pgyvpn/script/pgyvpn_track

	cd ${pkgdir}/usr/share/pgyvpn/script/
	install -Dm755 pgyvpn_sh_prompt ${pkgdir}/usr/share/bash-completion/completions/pgyvpn_sh_prompt
	install -Dm644 pgyvpn.service -t ${pkgdir}/usr/lib/systemd/system/
	install=$pkgname.install
}
