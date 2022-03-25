# Maintainer: June <june@eridan.me>
pkgname=q-zandronum
pkgver=1.2.1
pkgrel=1
_fmodex_ver=4.44.64
pkgdesc="Zandronum 3.0 fork with improved netcode and Quake movement"
arch=('x86_64' 'aarch64')
url="http://qzandronum.com/"
license=('custom')
depends=('sdl' 'libjpeg6-turbo' 'glu' 'openssl-1.0' 'fluidsynth')
optdepends=('timidity++: midi support' 'freedoom: free IWAD' 'gtk2: for a GUI selection screen' 'doomseeker: a GUI server browser')
makedepends=( 'zlib' 'sdl' 'libjpeg-turbo' 'nasm' 'gtk2' 'cmake' 'mercurial' 'fluidsynth' 'mesa' 'glu' )
_pkgname=q-zandronum
install=q-zandronum.install

source_x86_64=("https://github.com/IgeNiaI/Q-Zandronum/releases/download/${pkgver}/Q-Zandronum.${pkgver}.Linux.x64.tar.gz")

source_aarch64=("https://github.com/IgeNiaI/Q-Zandronum/releases/download/${pkgver}/Q-Zandronum.${pkgver}.Linux.arm64.tar.gz")

source=(
	'LICENSE.txt'
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"${pkgname}.desktop"
)

sha256sums_x86_64=('45a054d62781fe133c1161a148f768b98c84027bff2609b5bf74c43ec09604ed')
sha256sums_aarch64=('2d0ee315e783981a94e4c2e90295e336d6e02095447479bb9e66235d26d30240')

sha256sums=(
	'c9407f638950af1dc4ff0884aa73a41490390b79435a81805a8e9c8c0ec84adf'
	'1fe0a389e571c77aa0207c09bee6533828e818e7daff34640c0a01c25f094088'
	'3170f827179cc7c14f2755cc6a324fc12c71cde2793d21a8f0cdb829c9bb3469'
	'6dafab40b8eb87d3775748a3790a9e6e2bc6f46d0ea6873ae76ceaa4dc4a9783'
)

if [ "${CARCH}" == "x86_64" ];
then
        _fmod_suffix="64"
else
        _fmod_suffix=""
fi

package() {
  cd ${srcdir}

  install -Dm644 "q-zandronum.pk3" "${pkgdir}/usr/share/${pkgname}/q-zandronum.pk3"
  install -Dm755 "q-zandronum" "${pkgdir}/usr/share/${pkgname}/q-zandronum"
  install -Dm755 "q-zandronum-server" "${pkgdir}/usr/share/${pkgname}/q-zandronum-server"

  if [ "${CARCH}" == "x86_64" ];
  then
	  install -dm755 ${pkgdir}/usr/share/${pkgname}/Movement_Mods
	  cp -R "${srcdir}/Movement_Mods" "${pkgdir}/usr/share/${pkgname}"
	  install -dm755 ${pkgdir}/usr/share/${pkgname}/Doomseeker
	  cp -R "${srcdir}/Doomseeker" "${pkgdir}/usr/share/${pkgname}"
	  install -dm755 ${pkgdir}/usr/share/${pkgname}/lib
	  install -Dm755 "libfmodex${_fmod_suffix}-${_fmodex_ver}.so" "${pkgdir}/usr/share/${pkgname}/lib/libfmodex${_fmod_suffix}-${_fmodex_ver}.so"
	  install -Dm755 "liboutput_sdl.so" "${pkgdir}/usr/share/${pkgname}/lib/liboutput_sdl.so"
	  install -Dm755 "libcrypto.so.1.0.0" "${pkgdir}/usr/share/${pkgname}/lib/libcrypto.so.1.0.0"
  fi

  install -Dm755 "q-zandronum.launcher" "${pkgdir}/usr/bin/q-zandronum"
  install -Dm755 "q-zandronum-server.launcher" "${pkgdir}/usr/bin/q-zandronum-server"
  install -Dm644 "q-zandronum.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
