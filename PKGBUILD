# Maintainer: surefire <surefire@cryptomile.net>

pkgname='cinnamon-applet-global-appmenu-git'
pkgver=r99.d9eb339
pkgrel=1
pkgdesc='Cinnamon applet. Integrates the Ubuntu AppMenu (Global Menu) support into Cinnamon Desktop.'
arch=('any')
url='https://github.com/jake-phy/WindowIconList'
license=('GPL')
depends=('cinnamon' 'unity-gtk-module-standalone-bzr')
makedepends=('git')
provides=('cinnamon-applet-global-appmenu')
conflicts=('cinnamon-applet-global-appmenu')
source=("${pkgname}::git+https://github.com/lestcape/Global-AppMenu.git")
md5sums=(SKIP)
_appletname='globalAppMenu@lestcape'
_appletdir="usr/share/cinnamon/applets/${_appletname}"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm0755 "${pkgdir}/${_appletdir}"
  find "${_appletname}" -maxdepth 1 -type f -exec install -m0644 '{}' "${pkgdir}/${_appletdir}" \;
  install -dm0755 "${pkgdir}/${_appletdir}/interfaces-xml"
  find "${_appletname}/interfaces-xml" -maxdepth 1 -type f -exec install -m0644 '{}' "${pkgdir}/${_appletdir}/interfaces-xml" \;
    
  for mo in "${_appletname}/po/mo/"*.mo; do
    local lang=$(basename "$mo" .mo)
    install -dm0755 "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
    install -m0644 "$mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/${_appletname}.mo"
  done
}
