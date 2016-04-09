# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=skulltag-fixed
pkgver=098d
pkgrel=3
pkgdesc="Closed source OpenGL ZDoom port with Client/Server multiplayer. (Fixed package)"
arch=('i686' 'x86_64')
url="http://skulltag.com/"
license=('proprietary')
install=skulltag.install
changelog=
noextract=()
depends=('sdl' 'gtk2' 'libjpeg6')  # fmod SHOULD be a depends, or an optdepends... buuuuut it can't be packaged because their site requires registration for download now. balls.
optdepends=('timidity++: midi support'
            'freedoom: free IWAD')
makedepends=()
_pkgname='skulltag'
source=("http://www.skulltag.com/download/files/release/st-v${pkgver}_linux-base.tar.bz2"
	"${_pkgname}.launcher"
	"${_pkgname}-server.launcher"
	"st-v${pkgver}_linux-base.tar.bz2.sig"
	"${_pkgname}.launcher.sig"
	"${_pkgname}-server.launcher.sig")
source_i686=("http://www.skulltag.com/download/files/release/st-v${pkgver}_linux-x86.tar.bz2"
	     "st-v${pkgver}_linux-x86.tar.bz2.sig")
source_x86_64=("http://www.skulltag.com/download/files/release/st-v${pkgver}_linux-x86_64.tar.bz2"
	       "st-v${pkgver}_linux-x86_64.tar.bz2.sig")
provides=('skulltag')
conflicts=('skulltag')

sha512sums=('41d87724f3bcfaaca5e1c1753525ccc1a8f2ac742e84b4c3c5c4992d717b0f22b01756f9093233e0dcc89a9dfbf65a6ad6f3c4662ccc58a4453e85865977643b'
            '83d8ae08526a252a3ea655eccfe523bec01b05e0b10e3a07963aa59b8a152b2a64d85cfb6523b051ab1589ffdcb3427ab333afc105d65573c17d44832ad989e3'
            'a857a5d2468f3f74c9ec19e4e4703c86f1e7ac800ee52c3c29592c012827f7adad645d2b453344470f8bef6f71acad14ea3c023aa6310e573df2a502af2824a0'
            'SKIP'
            'SKIP'
            'SKIP')
sha512sums_i686=('6f52b675ae038e169c71a651f5224d658c34760afb7d1b724af0562ed6892e11b9dbfa1b818353b82ed4fb9b0e50b78a8b97d6199db12603ffb4d071cbbf2571'
                 'SKIP')
sha512sums_x86_64=('b16da4d4441f6f02eb19eb07c0bf4e54574fa831734b7e8daaaf107af92145e2cdb32c82a4147d467337cb028470e85f05ed3d5ab534ea7fc774be56007ceeb7'
                   'SKIP')

#prepare() {
	# No prep needed.
#}

#build() {
	# No build necessary.
#}

package() {
	cd ${srcdir}
	for d in $(find ./ -type d | sed -e 's@\./@@g');
	do
		install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/${d}
	done
	install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/lib
	install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
	install -D -m 755 ${srcdir}/${_pkgname}.launcher ${pkgdir}/usr/share/${_pkgname}.launcher
	install -D -m 755 ${srcdir}/${_pkgname}-server.launcher ${pkgdir}/usr/share/${_pkgname}-server.launcher
	for p in $(find ./ -type f -iname "*.pk3" | sed -e 's@\./@@g');
	do
		install -D -m 644 ${srcdir}/${p} ${pkgdir}/usr/share/${_pkgname}/${p}
	done
	install -D -m 755 ${srcdir}/${_pkgname} ${pkgdir}/usr/share/${_pkgname}/
	install -D -m 755 ${srcdir}/${_pkgname}-server ${pkgdir}/usr/share/${_pkgname}/
	install -D -m 755 ${srcdir}/libsnes_spc.so ${pkgdir}/usr/share/${_pkgname}/lib/
	install -D -m 755 ${srcdir}/liboutput_sdl.so ${pkgdir}/usr/share/${_pkgname}/lib/
	install -D -m 644 "${srcdir}/Skulltag Version History.txt" ${pkgdir}/usr/share/doc/${_pkgname}/history.txt

	install -d -m 755 ${pkgdir}/usr/bin
	cd ${pkgdir}/usr/bin
	ln -sf /usr/share/${_pkgname}/${_pkgname}.launcher ${_pkgname}
	ln -sf /usr/share/${_pkgname}/${_pkgname}-server.launcher ${_pkgname}-server
}
