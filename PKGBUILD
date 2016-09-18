# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Frank Fischer <frank-fischer@shadow-soft.de>
pkgname=sailautossh
pkgver=r120.5aaa9512be59
pkgrel=1
pkgdesc="Automatic SSH Tunneling tool"
arch=('i686' 'x86_64')
url="http://bitbucket.org/lyro/sailautossh"
license=('GPL3')
depends=(qt5-base hicolor-icon-theme)
makedepends=(mercurial)
provides=('sailautossh')
install=$pkgname.install
source=("hg+http://bitbucket.org/lyro/sailautossh")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sailautossh"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/sailautossh"
  qmake PREFIX=/usr CONFIG+=BUILD_DESKTOP sailautossh.pro
  make
}

package() {
	cd "${srcdir}/sailautossh"
	make INSTALL_ROOT="$pkgdir" install
}
