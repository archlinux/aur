# Maintainer:  tuxce <tuxce;net@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
 
pkgname=yaourt-git
pkgver=1.8.1.r11.g153c1f3
pkgrel=1
pkgdesc="A pacman wrapper with extended features and AUR support"
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=('GPL')
depends=('package-query-git' 'pacman>=5.0')
makedepends=('git')
optdepends=('aurvote: vote for your favorite AUR packages'
			'customizepkg: automatically modify PKGBUILD during install/upgrade'
			'rsync: retrieve PKGBUILD from official repositories')
provides=('yaourt')
conflicts=('yaourt')
backup=('etc/yaourtrc')
source=('git+https://github.com/archlinuxfr/yaourt.git')
md5sums=('SKIP')
_gitname=yaourt
 
pkgver () {
  cd $_gitname/src
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
  cd $_gitname/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var
}
 
package() {
  cd $_gitname/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

