pkgname=spectator-git
pkgver=v0.6.r73.g1da9894
pkgrel=2
pkgdesc="Desktop application to monitor router Turris"
arch=('i686' 'x86_64')
url="https://gitlab.labs.nic.cz/turris/spectator"
license=('GPL3')
depends=('qt5-base' 'qt5-translations' 'qt5-declarative')
makedepends=('git')
install=$pkgname.install
source=("$pkgname"::'git+https://gitlab.labs.nic.cz/turris/spectator.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    QT_SELECT=5 qmake
    make 
}

package() {
    cd "$srcdir/$pkgname"
    make INSTALL_ROOT="$pkgdir" install
}
