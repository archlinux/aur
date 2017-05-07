# Maintainer: Simone Gaiarin <simgunz@gmail.com>

pkgname=plasma5-applets-redshift-git
_gitpkgname=redshift-plasmoid
pkgver=r188.3dc240e
pkgrel=1
pkgdesc='Redshift plasmoid provides a configuration interface and allows to start/stop Redshift daemon either manually or automatically based on the current activity. Plasma5 development version.'
arch=('any')
url='http://simgunz.org/projects/redshift-plasmoid/'
license=('GPL')
depends=('plasma-workspace' 'redshift')
makedepends=('git' 'extra-cmake-modules')
install='redshift.install'
screenshot='http://simgunz.org/wp-content/uploads/2012/10/redshift-scr-1.png'
source=("git+https://github.com/simgunz/${_gitpkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitpkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitpkgname}"
  git checkout plasma5-porting
  cd ${srcdir}
  mkdir -p "build"
  cd build
  cmake ../$_gitpkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}
