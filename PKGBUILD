# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=moksha-forum-theme-git
pkgver=2859ffa
_pkgbase="BodhiForum GTK"
_pkgname=MokshaForum
_pkgname2=forum-elm
_pkgname3=forum-moksha
pkgrel=1
pkgdesc="Moksha Forum theme from git sources"
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
  cd "${srcdir}/${_pkgname}/${_pkgname2}"
  ./build.sh
  cd ../${_pkgname3}
  ./build.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/enlightenment/data/themes
  mkdir -p ${pkgdir}/usr/share/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgname2}.edj ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgname3}.edj ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/"${_pkgbase}" ${pkgdir}/usr/share/themes/
  chmod 755 -R ${pkgdir}/usr/share/enlightenment/data/themes ${pkgdir}/usr/share/themes
  install -D -m644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
