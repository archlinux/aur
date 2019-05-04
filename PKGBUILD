# Maintainer: Fina Wilke <fina at felinira dot net>
pkgname=libcloudproviders
pkgver=0.3.0
pkgrel=3
pkgdesc="DBus API that allows cloud storage sync clients to expose their services."
arch=(x86_64)
url="https://gitlab.gnome.org/World/libcloudproviders"
license=('LGPL')
groups=()
depends=(glib2 gobject-introspection vala)
makedepends=(git meson ninja gobject-introspection vala)
provides=("$pkgname=$pkgver")
provides+=("dbus-org.freedesktop.CloudProviderManager.service")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
_commit="79d1652a0aadab39648bc30db853cdb1d6e2bf95"
source=("git+https://gitlab.gnome.org/World/libcloudproviders.git#commit=$_commit")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	rm -r build 2>/dev/null || true
}

build() {
	cd "$srcdir/$pkgname"
	meson build --prefix /usr
	cd build
	ninja
}

check() {
    cd "$srcdir/$pkgname/build"
    meson test
}

package() {
	cd "$srcdir/$pkgname/build"
	DESTDIR=$pkgdir ninja install
}
