# Maintainer: nnnn20430 <nnnn20430@mindcraft.si.eu.org>
pkgname=webcit
pkgver=v9.01.r0.ga845b4f
pkgrel=1
pkgdesc="Citadel/UX is a collaboration suite (messaging and groupware) that is descended from the Citadel family of programs which became popular in the 1980s and 1990s as a bulletin board system platform."
arch=('i686' 'x86_64')
url="http://www.citadel.org/"
license=('GPL')
depends=('citadel')
makedepends=('git' 'citadel' 'libtool' 'autoconf' 'make' 'gcc')
optdepends=('openssl: SSL support' 'shared-mime-info: filetype identification')
conflicts=()
changelog=""
source=("git://git.citadel.org/appl/gitroot/citadel.git")
install="webcit.install"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/citadel"
  git checkout v9.01
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/citadel/webcit"
	./bootstrap
	./configure --prefix=/usr/local/webcit
	make
}

package() {
	cd "$srcdir/citadel/webcit"
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	cp "$startdir/webcit.service" "$pkgdir/usr/lib/systemd/system/webcit.service"
	cp "$startdir/webcits.service" "$pkgdir/usr/lib/systemd/system/webcits.service"
}
