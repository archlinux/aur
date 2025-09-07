#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-git
_pkgname=vegastrike
pkgver=0.10.0.alpha1.r14.ga6986688
pkgrel=1
pkgdesc="Vega Strike - Upon the Coldest Sea. Space flight and trading simulator with realistic distances"
arch=('any')
url="https://www.vega-strike.org"
license=('GPL')
depends=('expat' 'vegastrike-engine' 'python-screeninfo' 'python-kivy')
optdepends=()
makedepends=('git' 'cmake')
provides=('vegastrike')
conflicts=('vegastrike')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Assets-Production'
)
sha1sums=('SKIP'
)

pkgver() {
  cd "${srcdir}"/Assets-Production
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
 # echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
echo "Prepare section"
##Git branching stuff, useful for testing fixes before master
  cd ${srcdir}/Assets-Production/
##    git checkout -b stephengtuggy-fix/ship_view master
##    git pull https://github.com/stephengtuggy/Assets-Production.git fix/ship_view
#    git pull origin master
#    git checkout master
#    git merge origin/task_migrate_save_util
#    git push origin master

}


build(){
  cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}"/Assets-Production/CMakeLists.txt
}

package() {
  mkdir -p "${pkgdir}"
  make -C "${srcdir}" DESTDIR="${pkgdir}" install
}

