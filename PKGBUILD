pkgname=pacaur-no-ud
_pkgname=pacaur
pkgver=4.7.90
pkgrel=1
pkgdesc="An AUR helper that minimizes user interaction, edited to run -U instead of -Ud"
arch=('any')
url="https://github.com/rmarquis/pacaur"
license=('ISC')
depends=('cower' 'expac' 'sudo' 'git')
makedepends=('perl')
provides=('pacaur')
conflicts=('pacaur')
backup=('etc/xdg/pacaur/config')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rmarquis/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('237a716ddfe3eab43a0f7958be646d09')

build() {
    cd "$_pkgname-$pkgver"
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make install DESTDIR=$pkgdir PREFIX=/usr
	sed -i "s%-Ud%-U%g" $pkgdir/usr/bin/pacaur
}

