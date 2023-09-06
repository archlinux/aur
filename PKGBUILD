pkgname=wp-notifyd-git
_pkgname=wp-notifyd
pkgver=r12.1d46728
pkgrel=1
pkgdesc="A notification daemon for Wireplumber"
url="https://github.com/LDAP/wp-notifyd"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('meson' 'ninja')
depends=('wireplumber')
source=("git+https://github.com/LDAP/wp-notifyd")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd $_pkgname
	meson build --prefix=/usr
	cd build
	meson compile
}

package() {
	cd $_pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd build
	DESTDIR="$pkgdir" meson install
}
