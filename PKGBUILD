# Maintainer: 0x47
pkgname=systray-mdstat
pkgver=1.1.0
pkgrel=1
pkgdesc="System tray icon indicating the state of local Linux Software (MD) RAID by checking /proc/mdstat periodically"
arch=(any)
url="https://github.com/xtaran/systray-mdstat"
license=('GPL3')
groups=()
depends=("perl>=5.10" "perl-gtk3" "perl-glib-object-introspection" "perl-file-sharedir" "perl-try-tiny")
optdepends=("mdadm: making this tool functional")
source=("https://github.com/xtaran/${pkgname}/releases/download/${pkgver}/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('8110f1e1167dc128e67079752b46481d543daa2a1082181b8e4b120f49a69874')

package() {
	src="${srcdir}"

	install -dm755 $pkgdir/usr/share/perl5/vendor_perl/auto/share/dist/systray-mdstat
	install -Dm644 $src/share/* $pkgdir/usr/share/perl5/vendor_perl/auto/share/dist/systray-mdstat/

	install -dm755 $pkgdir/usr/bin
	install -Dm755 $src/bin/systray-mdstat $pkgdir/usr/bin/

	if [ -z "$XDG_CONFIG_DIRS" ]; then
		XDG_CONFIG_DIRS="/etc/xdg"
	fi
	install -dm755 $pkgdir/$XDG_CONFIG_DIRS/autostart
	install -Dm644 $src/systray-mdstat.desktop $pkgdir/$XDG_CONFIG_DIRS/autostart/
}
