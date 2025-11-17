# Maintainer: yuna0x0 <yuna@yuna0x0.com>
pkgname=cirno-catch-frog
pkgver=1.0.3
pkgrel=10
pkgdesc="Touhou fan game made with Godot. Let's help Cirno catch frogs!"
arch=('x86_64')
url="https://yuna0x0.itch.io/cirno-catch-frog"
license=('custom')
makedepends=('gendesk')
options=(!strip)
source=(
	https://cdn.yuna0x0.com/projects/${pkgname}/releases/v${pkgver}/CirnoCatchFrog-Linux_${arch}-${pkgver}.zip{,.sig}
	https://cdn.yuna0x0.com/projects/${pkgname}/releases/v${pkgver}/${pkgname}_icon.png{,.sig}
)
validpgpkeys=(
	'9EA1CC0896ABCA3D01CB68DFA28E81CED15846E6' # yuna0x0 <yuna@yuna0x0.com>
)
sha256sums=('c2c51cd5dcd591a4f5dee6e80e9e480e09a19719a4e8202db79517d2092d4963'
	'SKIP'
	'1f8ffa3dee9b46a9115ae90efd9cc12b5d66ec6bf3049c4e9ff010f1dd711c82'
	'SKIP')
b2sums=('3ac177a4f27e59d0684d95f7e53a989c34b3231a8af2d69fd3540d452864f08a70e6cceab1134b084c1674fd85faa67748e7e8d3d1012d27e49b06dc994a6c86'
	'SKIP'
	'0f076a1583302b2b3c2062626bf120b9c25b2c7c862e37389e1187faf82614352abcf37d037c2fe95bdd682ffccdd7e1ea46de931dabd308c5f925c05dc9561a'
	'SKIP')

prepare() {
	gendesk -n -f --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --name "Cirno Catch Frog" --categories "Game"
}

package() {
	install -D -t "${pkgdir}/opt/${pkgname}/" CirnoCatchFrog-Linux_${arch}-${pkgver}/*
	install -d "${pkgdir}/usr/bin/"
	ln -sf "/opt/${pkgname}/CirnoCatchFrog.${arch}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
