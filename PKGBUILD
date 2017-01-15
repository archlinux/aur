# Maintainer: Daniel Albers <daniel@lbe.rs>
# Source: <https://github.com/AlD/archlinux/tree/master/pkgbuilds/pam_krb5>

pkgname=pam_krb5
_gitver=2.4.12
pkgver=${_gitver/-/_}
_snapshot="${pkgname}-${pkgname}-${_gitver}"
pkgrel=1
pkgdesc="Allows PAM-aware applications to authenticate users by performing an AS exchange with a Kerberos KDC."
arch=("i686" "x86_64")
url="https://fedorahosted.org/pam_krb5/"
license=("LGPL")
depends=("pam" "krb5")
makedepends=("gettext" "autoconf")
provides=("pam-krb5")
conflicts=("pam-krb5")
source=("https://git.fedorahosted.org/cgit/${pkgname}.git/snapshot/${_snapshot}.tar.xz")
sha512sums=('de9f37500a8f161045e6cd5f704cf26fe1fbd65ddd91df2f8b64cf42c098546ad34009f827587db8fac631cc2cf3c114229259cd5f3007fe6f2d2f65a346ec31')

prepare() {
	cd "$_snapshot"
        rm -Rf autom4te.cache/
}

build() {
	cd "$_snapshot"
        autopoint -f
        autoreconf -i -f
        ./configure --prefix=/usr --sysconfdir=/etc --enable-maintainer-mode
	make
}

check() {
	cd "$_snapshot"
	make -k check
}

package() {
	cd "$_snapshot"
	make DESTDIR="$pkgdir/" install
}
