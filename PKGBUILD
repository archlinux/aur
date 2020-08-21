# Maintainer: Andrew Stevenson <andrew@ugh.net.au>
pkgname=dockclock
pkgver=1.0
pkgrel=1
pkgdesc="A clock dockapp that supports multiple time zones"
arch=('x86_64')
url=https://gitlab.com/cqexbesd/dockclock
license=('BSD')
depends=('libx11' 'glib2' 'gtk3')
makedepends=('bmake' 'pkgconf')
source=('https://gitlab.com/cqexbesd/dockclock/-/archive/v1.0/dockclock-v1.0.tar.gz')
sha256sums=('681c76803cf9c563ce4f5917417acafbcb6615cc31264076aaf6520ccdd77e49')

build() {
	cd "$pkgname-v$pkgver"
	# MANTARGET is set to cat in bsd.own.mk for unknown reasons
	bmake PREFIX=/usr MANTARGET=man
}

package() {
	cd "$pkgname-v$pkgver"
	# Arch packages should install to /usr so set PREFIX
	# Man hierachy is different under /usr so we set MANDIR
	# We want to install to a fakeroot so set DESTDIR
	# We might not have permissions to set ownership so set MK_INSTALL_AS_USER
	bmake PREFIX=/usr MANDIR=/usr/share/man MANTARGET=man DESTDIR=$pkgdir MK_INSTALL_AS_USER=yes install
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
