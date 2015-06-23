# Maintainer: nnnn20430 <nnnn20430@mindcraft.si.eu.org>
pkgname=citadel
pkgver=v9.01.r0.ga845b4f
pkgrel=1
pkgdesc="Citadel/UX is a collaboration suite (messaging and groupware) that is descended from the Citadel family of programs which became popular in the 1980s and 1990s as a bulletin board system platform."
arch=('i686' 'x86_64')
url="http://www.citadel.org/"
license=('GPL')
depends=('libcitadel' 'libev' 'c-ares' 'curl' 'expat' 'libical' 'libsieve' 'perl-berkeleydb')
makedepends=('git' 'libcitadel' 'libev' 'c-ares' 'curl' 'expat' 'libical' 'libsieve' 'perl-berkeleydb' 'libtool' 'autoconf' 'make' 'gcc')
optdepends=('openssl: SSL support' 'shared-mime-info: filetype identification')
conflicts=()
changelog=""
source=("git://git.citadel.org/appl/gitroot/citadel.git" "citadel.service")
install="citadel.install"
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/citadel"
  git checkout v9.01
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/citadel/citadel"
	./bootstrap
        ./configure --prefix=/usr/local/citadel
	make
}

package() {
        cd "$srcdir/citadel/citadel"
        make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	cp "$startdir/citadel.service" "$pkgdir/usr/lib/systemd/system/citadel.service"	
}
