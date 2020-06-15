#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-data-git
_pkgname=vegastrike
pkgver=1
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe-data files"
arch=('any')
url="www.vega-strike.org"
license=('GPL')
depends=('expat')
optdepends=('')
makedepends=('git' 'cmake')
provides=('vegastrike-data')
conflicts=('vegastrike-data')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Assets-Production')
sha1sums=('SKIP')

package() {
  cd "${srcdir}"

#data files install
  install -d "${pkgdir}"/usr/share
  cp -a "${srcdir}"/Assets-Production/ "${pkgdir}"/usr/share/${_pkgname}/
#remove some extra files
cd "${pkgdir}"/usr/share/${_pkgname}/
rm -rf .git
rm -rf .github
rm -rf .gitignore

#  mv "${pkgdir}"/usr/share/data "${pkgdir}"/usr/share/${_pkgname}

#install man page, .desktop file and icon
#  install -D -m644 "${pkgdir}"/usr/share/${_pkgname}/documentation/${_pkgname}.1 \
#    "${pkgdir}"/usr/share/man/man1/${_pkgname}.1

  install -D -m644 "${pkgdir}"/usr/share/${_pkgname}/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -D -m644 "${pkgdir}"/usr/share/${_pkgname}/${_pkgname}.xpm \
    "${pkgdir}"/usr/share/pixmaps/${_pkgname}.xpm

}
