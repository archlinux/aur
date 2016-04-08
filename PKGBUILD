# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# based on the zandronum2 PKGBUILD by Morgan Bohn, found at https://aur.archlinux.org/packages/zandronum2
# Since this is a development build and people may want to have both the latest stable AND development,
# it installs alongside rather than as a conflict of zandronum2.
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=zandronum-dev
_pkgname=zandronum
pkgver=3.0
_pkgver2=160229-1221
_pkgver=${pkgver}-${_pkgver2}
fmodex_ver=4.24.16
pkgrel=1
_pkgdl=ZandroDev
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer. (Development Build ${_pkgver})"
arch=('i686' 'x86_64')
url="https://zandronum.com"
license=('custom')
install=zandronum-dev.install
changelog=
noextract=()
depends=('sdl' 'libjpeg6-turbo' 'glu' 'openssl' 'fluidsynth')
optdepends=('timidity++: midi support'
            'freedoom: free IWAD'
	    'gtk2: for a GUI selection screen')
makedepends=()
source=("LICENSE"
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"${pkgname}.launcher.sig"
	"${pkgname}-server.launcher.sig"
	"LICENSE.sig")
source_x86_64=("https://zandronum.com/downloads/testing/${pkgver}/${_pkgdl}${_pkgver}linux-x86_64.tar.bz2"
	       "${_pkgdl}${_pkgver}linux-x86_64.tar.bz2.sig")
source_i686=("https://zandronum.com/downloads/testing/${pkgver}/${_pkgdl}${_pkgver}linux-x86.tar.bz2"
	       "${_pkgdl}${_pkgver}linux-x86.tar.bz2.sig")
provides=('zandronum2')  # required for doomseeker, etc- but you can have multiple packages provide for the same dependency
sha512sums=('b928f3211ff31f17fc2d754728e299b5783e1b946b4019713718b7613e13ff0a7c4f02087c0ab4f137f7a0de57a2bfeaa6ed63285d0e6063d2b4734b097ce9e1'
            '7595135cc49c02278b9871afe5291e45fb6811b858b900f52f6b606239aafc02f6f046f0de516922fad4cac2236320fde9711040a18c0a639f3b1be26fd54404'
            'ffa128418e045dc8a978f10a09964f385e0097a71fb6e62396447707a0c396d7526f24b3fc74c33aecca109b79aa8a36c309774904293909182dd80637e9c5e1'
            'SKIP'
            'SKIP'
            'SKIP')
sha512sums_i686=('c619be46825b8a0b4468769b831d4db0332fb8220526b7d5bbbadd66309f3659dc724f97ba2b63abe57d1eaf225cc6cb002a15776f55898e46ce3f386350c011'
                 'SKIP')
sha512sums_x86_64=('34d748a18ccc3d97131f95ed9de2809d91c02f9794fbecde5424b80abdc2a1f7e39bc942686245adb341f93da192c77d2e5942804b2e477acbaa1936772871f0'
                   'SKIP')

#prepare() {
	# no prep necessary
#}

#build() {
	# no build necessary
#}

package() {
	install -d -m 755 "${pkgdir}/usr/share/${pkgname}/lib"
	install -D -m 644 "${srcdir}/${_pkgname}.pk3" "${pkgdir}/usr/share/${pkgname}/"
	install -D -m 644 "${srcdir}/skulltag_actors.pk3" "${pkgdir}/usr/share/${pkgname}/"
	install -D -m 755 "${srcdir}/liboutput_sdl.so" "${pkgdir}/usr/share/${pkgname}/lib/"
	install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/${pkgname}/"
	install -D -m 755 "${srcdir}/${_pkgname}-server" "${pkgdir}/usr/share/${pkgname}/"
	install -D -m 755 "${srcdir}/${pkgname}.launcher" "${pkgdir}/usr/share/${pkgname}/"
	install -D -m 755 "${srcdir}/${pkgname}-server.launcher" "${pkgdir}/usr/share/${pkgname}/"
	if [[ "${CARCH}" == 'x86_64' ]];
	then
		install -D -m 755 "${srcdir}/libfmodex64-${fmodex_ver}.so" "${pkgdir}/usr/share/${pkgname}/lib/"
	else
		install -D -m 755 "${srcdir}/libfmodex-${fmodex_ver}.so" "${pkgdir}/usr/share/${pkgname}/lib/"
	fi

	install -d -m 755 "${pkgdir}/usr/bin"
	cd ${pkgdir}/usr/bin
	ln -sf /usr/share/${pkgname}/${_pkgname}.launcher ${pkgname}
	ln -sf /usr/share/${pkgname}/${_pkgname}-server.launcher ${pkgname}-server
	
}
