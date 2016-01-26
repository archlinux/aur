# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=moksha-detour-theme-git
pkgver=cbcc45a
_pkgname=MokshaDetour
_pkgbase=detourious
pkgrel=1
pkgdesc="Moksha Detour from git sources"
arch=('any')
url="http://mokshadesktop.org"
license=('BSD')
source=("$_pkgname::git+https://github.com/JeffHoogland/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}/detourious"
  ./build.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgbase}.edj ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgbase}-GTK ${pkgdir}/usr/share/themes/
  chmod 755 -R ${pkgdir}/usr/share/enlightenment/data/themes ${pkgdir}/usr/share/themes
  install -D -m644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
