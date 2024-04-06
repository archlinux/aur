# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
pkgname=ersatztv-bin
_pkgname=ersatztv
pkgnamecaps=ErsatzTV
pkgver=0.8.6
pkgrel=1
pkgdesc="Software for configuring and streaming custom live channels using your media library"
url="https://ersatztv.org/"
arch=('x86_64' 'aarch64')
license=('zlib')
provides=('ersatztv')
optdepends=('ffmpeg')
options=('!strip')
source=("$_pkgname.service" "$_pkgname.sysusers" "$_pkgname.tmpfiles")
source_x86_64=("https://github.com/$pkgnamecaps/$pkgnamecaps/releases/download/v$pkgver-beta/$pkgnamecaps-v$pkgver-beta-linux-x64.tar.gz")
source_aarch64=("https://github.com/$pkgnamecaps/$pkgnamecaps/releases/download/v$pkgver-beta/$pkgnamecaps-v$pkgver-beta-linux-arm64.tar.gz")
sha256sums=('27b89ea376c06600ae7871f4e9db6cafb446e38e59334bdf31983bfa9f8bc550'
            'b8fc55ba6da728a51e2d0ce5add05e8a9500a0e7626c55b042d6b55763bc1ad5'
            '95bb7e34c04af1288af7765940fd73c6807bba3fd276a9cb32f243b029d20d66')
sha256sums_x86_64=('a576d1783fdd1c25bba69e7388d103eff1ed914b388d0c8fad418ad48287b2fa')
sha256sums_aarch64=('8ad7a49e280bd6f74b192c1678cdc858c39d02f4869c4b94b141da4f79c400a4')

package() {
	cd "$srcdir"
	install -vDm 644 ${_pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm 644 ${_pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	mkdir -p "$pkgdir/opt/$_pkgname"
	if [ "$arch" == "x86_64" ]; then
		cd "$pkgnamecaps-v$pkgver-beta-linux-x64"
	elif [ "$arch" == "aarch64" ]; then
		cd "$pkgnamecaps-v$pkgver-beta-linux-arm64"
	fi
	mv * "$pkgdir/opt/$_pkgname/"
}
