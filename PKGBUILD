# Maintainer: d10n <david at bitinvert dot com>
# Contributor: Simo Leone <leone.simo AT gmail DOT com>
_pkgname=amtterm
pkgname="$_pkgname-git"
pkgver=1.7.r25.gfc5ee7a
pkgrel=1
pkgdesc="Tools to connect to Intel AMT enabled machines via Serial-Over-LAN"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/blog/linux/$_pkgname/"
license=('GPL2')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gnutls' 'perl' 'perl-soap-lite')
makedepends=('git' 'meson' 'ninja' 'vte3')
optdepends=('vte3: for the gamt GUI')
source=("git+https://gitlab.com/kraxel/amtterm.git")
sha256sums=('SKIP')
validpgpkeys=('A0328CFFB93A17A79901FE7D4CB6D8EED3E87138') # Gerd Hoffmann (work) <kraxel@redhat.com>

pkgver() {
	cd "$srcdir/$_pkgname"
	# 1.7
	# amtterm-1.7-1-25-gfc5ee7a -> r25.gfc5ee7a
	printf '%s.%s' "$(cat VERSION)" "$(git describe --long | sed 's/^.*-\([0-9]*-g[a-f0-9]*\)$/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
	arch-meson "$srcdir/$_pkgname" build
	ninja -C build
}

package() {
	cd "$srcdir/$_pkgname"
	meson install --destdir="$pkgdir" -C build
}

# vim: set ft=sh ts=4 sw=4 noet:
