# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=moksha-kl4k-theme-git
pkgver=a1b7d57
_pkgname=MokshaKL4K
_pkgname2=KL4KElm
pkgrel=1
pkgdesc="Moksha KL4K theme from git sources"
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
  cd ../${_pkgname2}
  ./build.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgname}.edj ${pkgdir}/usr/share/enlightenment/data/themes
  cp -a ${srcdir}/${_pkgname}/${_pkgname2}.edj ${pkgdir}/usr/share/enlightenment/data/themes
  chmod 755 -R ${pkgdir}/usr/share/enlightenment/data/themes
  install -D -m644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
