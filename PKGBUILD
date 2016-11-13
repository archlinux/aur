# Maintainer: psykar <aur@psykar.com>

pkgname='cinnamon-applet-icingtaskmanager-git'
pkgver=r113.2174165
pkgrel=2
pkgdesc='Cinnamon applet. Window List with App Grouping and Window Thumbnails for Cinnamon.'
arch=('any')
url='https://github.com/jaszhix/icingtaskmanager'
license=('GPL')
depends=('cinnamon')
makedepends=('git')
source=("${pkgname}::git+https://github.com/jaszhix/icingtaskmanager.git#branch=master")
md5sums=(SKIP)
_appletname='IcingTaskManager@json'
_appletdir="usr/share/cinnamon/applets/${_appletname}"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm0755 "${pkgdir}/${_appletdir}"
  find "src" -maxdepth 1 -type f -exec install -m0644 '{}' "${pkgdir}/${_appletdir}" \;
    
  for mo in "src/locale/mo/"*.mo; do
    local lang=$(basename "$mo" .mo)
    install -dm0755 "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
    install -m0644 "$mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/${_appletname}.mo"
  done
}
