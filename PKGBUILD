# Maintainer: xgjmibzr <xgjmibzr[AT]gmail.com>

pkgname=yabsm-git
pkgver=r504.347b164
pkgrel=1
pkgdesc="Yet Another BTRFS Snapshot Manager"
arch=("$CARCH")
url="https://github.com/NicholasBHubbard/yabsm"
license=('MIT')
depends=('perl>=5.16.3' 'btrfs-progs' 'openssh')
provides=("yabsm=$pkgver")
source=("git+https://github.com/NicholasBHubbard/yabsm.git")
sha256sums=('SKIP')

pkgver()
{
	cd "$srcdir/yabsm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
	chmod +x ${srcdir}/yabsm/export/yabsm.fatpack.pl
}

package()
{
	# Executable
	install -dm755 "${pkgdir}/usr/local/bin/"
	cp -a "${srcdir}/yabsm/export/yabsm.fatpack.pl" \
		"${pkgdir}/usr/local/bin/yabsm"

	# Config
	install -dm755 "${pkgdir}/etc/"
	cp -a "${srcdir}/yabsm/export/yabsm.conf.example" \
		"${pkgdir}/etc/"

	# License
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp -a "${srcdir}/yabsm/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"
}
