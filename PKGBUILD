# Maintainer: 0x47
pkgname=systray-mdstat
pkgver=1.0.1
pkgrel=1
pkgdesc="System tray icon indicating the state of local Linux Software (MD) RAID by checking /proc/mdstat periodically"
arch=(any)
url="https://github.com/xtaran/systray-mdstat"
license=('GPL3')
groups=()
depends=("perl>=5.10" "perl-gtk3" "perl-glib-object-introspection" "perl-file-sharedir" "perl-try-tiny")
optdepends=("mdadm: making this tool functional")
install=
source=("https://github.com/xtaran/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=(4cac16618e8af65b963a969c16d3f19eae251b0773fdf95df74c2670413deb93)

package() {
	src="${srcdir}/${pkgname}-${pkgver}"

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
