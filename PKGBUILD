# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=spotmachine-git
_pkgname=spotmachine
pkgver=r61.143083d
pkgrel=1
pkgdesc="A program to record and sequentially play audio spots (git)"
url="https://github.com/pryds/spotmachine"
depends=('java-runtime')
makedepends=('git' 'java-environment')
conflicts=(spotmachine)
license=('GPL')
arch=('any')
source=("${pkgname}"::'git+https://github.com/pryds/spotmachine.git'
        "spotmachine.sh"
        "spotmachine.desktop")
md5sums=('SKIP'
         '4062ac402e5195f91962b79c59759225'
         '40575314e378701e968988bb7b07a711')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}/src
  ./build.sh
}

package() {
  install -d ${pkgdir}/usr/share/java/${_pkgname}/lib/{po,resources}

  cd ${srcdir}/${pkgname}/src
  install -Dm644 debian/spotmachine.desktop ${pkgdir}/usr/share/applications/spotmachine.desktop
  install -Dm644 debian/copyright ${pkgdir}/usr/share/doc/${_pkgname}/copyright
  install -Dm644 resources/* ${pkgdir}/usr/share/java/${_pkgname}/lib/resources
  install -Dm644 po/* ${pkgdir}/usr/share/java/${_pkgname}/lib/po
  install -Dm644 resources/spotmachine.svg ${pkgdir}/usr/share/pixmaps/${_pkgname}.svg

  cd ${srcdir}/${pkgname}/bin
  cp -r gui i18n main version ${pkgdir}/usr/share/java/${_pkgname}
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
