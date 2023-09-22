# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
pkgname=kitsas-appimage
_basename=kitsas
_reponame=kitupiikki
pkgver=5.1
_repover="${pkgver//_/-}"
_appimagefile="Kitsas-${_repover}-x86_64.AppImage"
pkgrel=1
epoch=
pkgdesc="Finnish bookkeeping software for small organisations - AppImage version"
arch=('x86_64')
url="https://kitsas.fi/"
license=('GPL3')
groups=()
depends=("zlib")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("kitsas")
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(
	"https://github.com/artoh/${_reponame}/releases/download/v${_repover}/${_appimagefile}"
	"https://github.com/artoh/${_reponame}/raw/v${_repover}/${_basename}.desktop"
	"https://github.com/artoh/${_reponame}/raw/v${_repover}/${_basename}.png"
)
noextract=()
sha256sums=(
	"0aa33f0ed6721e25dabf214bc5a894977fa66d7546e2786a013f57c1ef4343d5"
	"f015743e6b0f79b2f14d6af2a747a3839256288e006175c35ba6a449b4b1687c"
	"ec145dcce45fc98b9e50e0eb4b3ace45dbb5f62c8d678a300076d951ba80336e"
)

validpgpkeys=()
_install_path="/opt/appimages"

prepare() {
	sed "s,Exec=${_basename},Exec=${_install_path}/${_basename}.AppImage,g" -i "${_basename}.desktop"
}

package() {
	install -Dm755 "${srcdir}/${_appimagefile}" "${pkgdir}/${_install_path}/${_basename}.AppImage"
	install -Dm644 "${srcdir}/${_basename}.png" "${pkgdir}/usr/share/icons/${_basename}.png"
	install -Dm644 "${srcdir}/${_basename}.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"
}

