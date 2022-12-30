# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=pa
pkgname=${_pkgname}-age-git
pkgver=r41.6cd0cdb
pkgrel=1
pkgdesc="a simple password manager. encryption via age, written in portable posix shell "
arch=('any')
url="https://github.com/biox/pa"
license=('GPL3')
makedepends=('git')
depends=('age')
optdepends=('bemenu: optional launcher'
						'dmenu: optional launcher'
						'fuzzel: optional launcher'
						'rofi: optional launcher')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"/"${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
  cd contrib
  install -Dm644 pa-bemenu "${pkgdir}"/usr/share/doc/"${_pkgname}"/pa-bemenu
  install -Dm644 pa-dmenu "${pkgdir}"/usr/share/doc/"${_pkgname}"/pa-dmenu
  install -Dm644 pa-fuzzel "${pkgdir}"/usr/share/doc/"${_pkgname}"/pa-fuzzel
  install -Dm644 pa-rofi "${pkgdir}"/usr/share/doc/"${_pkgname}"/pa-rofi
}
