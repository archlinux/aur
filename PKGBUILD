# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=spacenet
pkgname=${_pkgname}-git
pkgver=r98.a115018
pkgrel=1
pkgdesc="spacenet is_a non-linear retro sci-fi adventure."
arch=('any')
url='https://sonejostudios.github.io/SpaceNET/'
license=('GPL3')
depends=('renpy-sdk')
makedepends=('git') 
source=(
  ${pkgname}::git+https://github.com/sonejostudios/SpaceNET.git
  "${_pkgname}"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
)
sha256sums=(
  'SKIP'
  '34ca6100f834cf29756eaa0890d3149d052a80d560dd90fda8573f0a44fb38cd'
  '3893354e76daa10ed537089230bfd5e82f75ff09654b11ccbd70b5d5028bb694'
  '1b62266a4cfef3dce256744c694aca60b652a6cd08bdf956c182332fb2857aea'
)

pkgver() {
	cd "${pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # copy main files
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  cp -r game/* "${pkgdir}/usr/share/${_pkgname}"

  # copy license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # copy bash script
  install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
