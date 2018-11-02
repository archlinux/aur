# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=lightdm-mini-greeter-git
pkgver=0.3.4.r0.4244751
pkgrel=1
pkgdesc="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
arch=('i686' 'x86_64')
url="https://github.com/prikhi/lightdm-mini-greeter"
license=('GPL3')
depends=('lightdm' 'gtk3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/lightdm/lightdm-mini-greeter.conf')
source=("${pkgname}::git+https://github.com/prikhi/lightdm-mini-greeter.git#branch=master"
        "lightdm-mini-greeter.install")
sha256sums=('SKIP'
            '5fb6e83300952950cf8936d11d20b85e9622a88f84e18c43fda2d41ebcedf857')
install="lightdm-mini-greeter.install"

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$pkgname"
    ./autogen.sh
    ./configure --datadir=/usr/share --bindir=/usr/bin --sysconfdir=/etc
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
