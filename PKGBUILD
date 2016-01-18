# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=moksha-radiance-theme-git
pkgver=5cb43db
_pkgname=MokshaRadiance
pkgrel=1
pkgdesc="Moksha Radiance from git sources"
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
  cd "${srcdir}/${_pkgname}/${_pkgname}"
  ./build.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgname}.edj ${pkgdir}/usr/share/enlightenment/data/themes
  chmod 755 -R ${pkgdir}/usr/share/enlightenment/data/themes
  install -D -m644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
