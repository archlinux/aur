# Maintainer: ros3 <ros3@ros3.cc>
# Contributor: 5donuts <5donuts@protonmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mplus-git
pkgver=r286.71d438c
pkgrel=1
pkgdesc='A little nifty font family for everyday usage (git version)'
_repo_name='MPLUS_FONTS'
url='https://mplusfonts.github.io/'
arch=('any')
license=('OFL-1.1')
makedepends=('git')
source=(git+https://github.com/coz-m/${_repo_name}.git)
conflicts=('ttf-mplus' 'mplus-font')
md5sums=('SKIP')

pkgver() {
  cd "${_repo_name}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${srcdir}/${_repo_name}/fonts/ttf

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/

  cd ${srcdir}/${_repo_name}

  install -D -m644 OFL.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
