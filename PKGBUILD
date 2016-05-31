# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gnome-twofactorauth-git
_gitname=TwoFactorAuth
pkgver=0.1beta2
pkgrel=1
pkgdesc='Two-Factor Authentication code generator for Gnome'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-gobject' 'python-cairo' 'python-pyotp')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools')

options=('!emptydirs')
install=gnome-twofactorauth.install
source=("https://github.com/bil-elmoussaoui/TwoFactorAuth/archive/v${pkgver}.zip")
md5sums=('SKIP')
conflicts=('gnome-twofactorauth')
provides=("gnome-twofactorauth=$pkgver")

build() {
	cd "$srcdir/${_gitname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}
