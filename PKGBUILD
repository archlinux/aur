# Maintainer: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
pkgname=zandronum
pkgver=3.2.1
pkgrel=2
_fmodex_ver=4.44.64
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer"
arch=('x86_64')
url="https://zandronum.com/"
license=('custom')
depends=('sdl' 'libjpeg-turbo' 'glu' 'openssl-1.1' 'fluidsynth')
optdepends=('timidity++: midi support' 'freedoom: free IWAD' 'gtk2: for a GUI selection screen' 'doomseeker: a GUI server browser')
_pkgname=zandronum
conflicts=('zandronum2')
install=zandronum.install

source=(
	"https://zandronum.com/downloads/${_pkgname}${pkgver}-linux-x86_64.tar.bz2"
	'LICENSE.txt'
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"${pkgname}.png"
	"${pkgname}.desktop"
)

sha256sums=(
	'9f4b93ed99ab15d2406e697e2a06d956eb808c9ac2e53e62ae9f1affb53c86c0'
	'c9407f638950af1dc4ff0884aa73a41490390b79435a81805a8e9c8c0ec84adf'
	'2ff85effc7146b467201f473be5614dc109a03ae2528eafccffba5dcb8354b97'
	'3e08296d00c8ee7445a9f9dfa6659acc7fd69ad672ae5382d79e1535413aa8fa'
	'd10d4c39b5c0a6e7e94342c463daae55928b464baac8912cfbf8603dc50f10f5'
	'dd20e904dacc5c181b711272f6908049202d0528608f648554721cc88659e523'
)

if [ "${CARCH}" == "x86_64" ];
then
	_fmod_suffix="64"
else
	_fmod_suffix=""
fi

package() {
  cd ${srcdir}

  install -Dm644 "zandronum.pk3" "${pkgdir}/usr/share/${pkgname}/zandronum.pk3"
  install -Dm644 "skulltag_actors.pk3" "${pkgdir}/usr/share/${pkgname}/skulltag_actors.pk3"
  install -Dm755 "zandronum" "${pkgdir}/usr/share/${pkgname}/zandronum"
  install -Dm755 "zandronum-server" "${pkgdir}/usr/share/${pkgname}/zandronum-server"
  install -Dm755 "zandronum.launcher" "${pkgdir}/usr/bin/zandronum"
  install -Dm755 "zandronum-server.launcher" "${pkgdir}/usr/bin/zandronum-server"
  install -Dm755 "libfmodex${_fmod_suffix}-${_fmodex_ver}.so" "${pkgdir}/usr/share/${pkgname}/lib/libfmodex${_fmod_suffix}-${_fmodex_ver}.so"
  install -Dm644 "zandronum.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "zandronum.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -dm755 ${pkgdir}/usr/share/${pkgname}/lib

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
