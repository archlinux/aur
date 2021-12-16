# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=valabind-git
pkgver=20211216.353.98f8315
pkgrel=1
pkgdesc="Tool to parse vala or vapi files to transform them into swig interface files, C++ source files, GIR or GEAR"
arch=('i686' 'x86_64')
url="https://github.com/radare/valabind"
license=('GPLv3')
makedepends=('git')
depends=('vala' 'swig')
conflicts=('valabind' 'valabind-hg')
provides=('valabind')

source=("$pkgname"::"git+https://github.com/radare/valabind.git")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
} 
