# Maintainer: LinArcx <linarcx@gmail.com>

pkgname=gnulium
pkgver=0.1.0.r0.g2da84b0
pkgrel=1
pkgdesc="A Graphical Ui for managing scripts and ideas!" # "Make Your Gnu/linux More Readble and Easy to Understand."
url="https://github.com/LinArcX/Gnulium"
arch=('x86_64')
license=('GPL-3.0')
depends=('qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-charts' 'jcal-git')
makedepends=('git' 'qt5-base')
source=("${pkgname}::git+https://github.com/LinArcX/Gnulium")
sha256sums=('SKIP')
# provides=("${pkgname}" 'gnulium')
# conflicts=("${pkgname}" 'gnulium') 

pkgver() {
  cd "$srcdir/${pkgname}"
		( set -o pipefail
			git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		)
  # cd $pkgname
  # git log -1 --date=format:%Y%m%d --pretty=format:%cd
}

build() {
  cd $pkgname
  qmake
  make
}

package() {
  cd $pkgname
  install -Dm755 ./gnulium ${pkgdir}/usr/bin/gnulium
  install -Dm644 ./appconf/gnulium.desktop ${pkgdir}/usr/share/applications/gnulium.desktop
	install -Dm644 ./appconf/gnulium.svg ${pkgdir}/usr/share/pixmaps/gnulium.svg
	install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/gnulium/LICENSE
  
  # install -d ${pkgdir}/usr/share/persepolis	
  # install -Dm644 ./man/persepolis.1.gz ${pkgdir}/usr/share/man/man1/neompv.1.gz
  # make INSTALL_ROOT="$pkgdir" install
  # install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}