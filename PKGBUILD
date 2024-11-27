# Maintainer: ShoreNinth <shoreninth@outlook.com>

pkgname=pgyvisitor
_pkgname=PgyVisitor
pkgver=6.9.0
pkgrel=1
pkgdesc="贝锐蒲公英客户端 Oray Pgy Visitor"
arch=("x86_64" "i686" "aarch64" "armv7h")
url="https://pgy.oray.com"
license=('custom')
options=("!strip" "!debug")

source=('LICENSE::https://service.oray.com/question/1820.htm')
source_x86_64=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2549/$_pkgname-$pkgver-amd64.deb")
source_i686=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2549/$_pkgname-$pkgver-i386.deb")
source_aarch64=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2549/$_pkgname-$pkgver-arm64.deb")
source_armv7h=("$_pkgname-$pkgver.deb::${url}/softwares/153/download/2549/$_pkgname-$pkgver-arm32.deb")

sha256sums=('SKIP')
sha256sums_x86_64=('3a53e1b36266f5031c9b4d35c02df18583437fedb384a58e897dde7c2ac8b60d')
sha256sums_i686=('ea36cb6ada55c8dc01438cbc4a3df33465bceecd74f1c6f7ff21809cf1a2834d')
sha256sums_aarch64=('ff29a02dc9d2c19e1978288cd43904ce1d6066dd5ce237196deb800066a0c659')
sha256sums_armv7h=('bda082aad45c929f5019e9bb0605246f5d9eeffa9df0bb93afa12d674e4782f0')

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
