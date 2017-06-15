# Maintainer: Skunnyk <skunnyk@alteroot.org>
pkgname=xfce4-vala-git
_pkgname=${pkgname%-git}
pkgver=4.10.0.r4.g62f270a
pkgrel=2
pkgdesc='Vala Bindings for the Xfce framework'
arch=('any')
license=('GPL')
url='https://wiki.xfce.org/vala-bindings'
groups=('xfce4-goodies')
conflicts=('xfce4-vala')
provides=('xfce4-vala')
makedepends=('xfce4-dev-tools')
options=('!libtool')
source=('git://git.xfce.org/bindings/xfce4-vala')
sha256sums=('SKIP')

pkgver() {
	  cd "$_pkgname"
	  git describe --long | sed 's/^xfce4-vala-//;s/\([^-]*-g\)/r\1/;s/-/./g'
    }

build() {
	cd "$_pkgname"/

	# Don't need to run make, this package only provide a set of .vapi files
	# We force vala-api to what version is provided by arch atm.
	./autogen.sh --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--enable-maintainer-mode \
		--with-vala-api=0.36
}

package() {
	cd "$_pkgname"

	make DESTDIR="${pkgdir}" install
}

