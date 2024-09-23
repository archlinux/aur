# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=danisrace
pkgname=${_pkgname}-git
pkgver=r4.db92590
pkgrel=1
pkgdesc="The Libre Game Dani's Race."
arch=('x86_64')
url="https://forg.madiator.cloud/BlenderDumbass/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('upbge' 'gtk3' 'python' 'python-cairo' 'python-gobject' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications

  cp -R "./." ${pkgdir}/usr/share/${_pkgname}/
  rm ${pkgdir}/usr/share/${_pkgname}/logo.png \
    "${pkgdir}/usr/share/${_pkgname}/DanisRace Debug.txt" \
    ${pkgdir}/usr/share/${_pkgname}/checklist.org

  install -Dm 644 ./logo.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png

  echo $'#!/usr/bin/env sh\ncd /usr/share/danisrace\npython ./run.py' > ${pkgdir}/usr/bin/danisrace
  chmod 755 ${pkgdir}/usr/bin/danisrace

  echo $'[Desktop Entry]\nExec=danisrace\nIcon=danisrace\nName=Dani\'s Race\nPath=\nType=Application\nCategories=GTK;Game;\nComment=The Libre Game Dani\'s Race.\n' > ${pkgdir}/usr/share/applications/danisrace.desktop
  chmod 755 ${pkgdir}/usr/share/applications/danisrace.desktop
}
