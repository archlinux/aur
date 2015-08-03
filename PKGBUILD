pkgname=qtcreator-cmakeprojectmanager2-plugin-git
pkgver=r3.4.26.f7c2dbf
pkgrel=1
qtc_branch=3.4
pkgdesc="Enhanced CMake Project Manager plugin for Qt Creator"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url='https://github.com/h4tr3d/cmakeprojectmanager2'
license=('Unknown')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/amezin/cmakeprojectmanager2.git#branch=qtc-${qtc_branch})
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s.%s" "${qtc_branch}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD="${srcdir}" qmake \
    "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}/usr/" install
}
