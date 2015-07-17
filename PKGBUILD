# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>
		
_srcname=delaycut
pkgname=${_srcname}-git_p
pkgver=1.4.3.7.r17.gcd12340
pkgrel=1
pkgdesc="Cuts and corrects delay in ac3 and dts files."
arch=('i686' 'x86_64')
url='https://github.com/darealshinji/delaycut'
license=('GPL3')
depends=('qt4')
makedepends=('git')
conflicts=('delaycut' 'delaycut-git')
provides=('delaycut')
source=("${_srcname}::git+https://github.com/darealshinji/delaycut.git")
sha256sums=('SKIP')

pkgver() {
  cur_prefix='v'
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_srcname}"
  qmake-qt4 CONFIG+=Linux delaycut.pro
  make
}

package () {
  cd "${srcdir}/${_srcname}"
  install -Dm755 delaycut "${pkgdir}"/usr/bin/delaycut
  install -Dm644 extra/delaycut.desktop "${pkgdir}"/usr/share/applications/delaycut.desktop
  install -Dm644 extra/delaycut.xpm "${pkgdir}"/usr/share/pixmaps/delaycut.xpm  
}
