# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Adria Arrufat (archdria) <swiftscythe@gmail.com>

_pkgname=ardentryst
pkgname=${_pkgname}-git
pkgver=r48.a135dba
pkgrel=2
pkgdesc="An action/RPG sidescoller with a focus on story and character development"
arch=('any')
conflicts=(${_pkgname})
url="https://github.com/ardentryst/ardentryst"
license=('GPL3' 'CCPL')
depends=('python-pygame') 
makedepends=('git') 
source=(git+https://github.com/ardentryst/ardentryst.git
        ${_pkgname}.sh)
md5sums=('SKIP'
         'ff70054fd330fea43c67c9b7486080c3')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"/"${_pkgname}"

  # install data
  install -m755 -d "${pkgdir}"/usr/share/${_pkgname}
  cp -rf \
    {Base,Data,Fonts,Levels,Music,Sounds,COPYING*} \
    *.{py,txt,png,xml,dig} \
    "${pkgdir}"/usr/share/${_pkgname}/

  # set permissions
  find "${pkgdir}"/usr/share/${_pkgname} -type d -exec chmod 755 {} +
  find "${pkgdir}"/usr/share/${_pkgname} -type f -exec chmod 644 {} +

  # install icon
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/${_pkgname}.png

  # install .desktop file
  install -Dm644 Ardentryst.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # install launcher
  install -Dm755 ../${_pkgname}.sh "${pkgdir}"/usr/bin/${_pkgname}
}
