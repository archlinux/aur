# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=nvidia-xrun-pm-git
pkgver=0.3.2.r19.gaf3b734
pkgrel=3
pkgdesc='Alternative version of nvidia-xrun, that relies on kernel PM instead of bbswitch'
arch=('x86_64')
url='https://github.com/michelesr/nvidia-xrun-pm'
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa-libgl')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('nvidia-xrun' 'nvidia-xrun-git' 'nvidia-xrun-pm')
conflicts=('nvidia-xrun' 'nvidia-xrun-git' 'nvidia-xrun-pm')
replaces=()
backup=(etc/X11/nvidia-xorg.conf)
options=()
install=$pkgname.install
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm 644 nvidia-xorg.conf "${pkgdir}/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "${pkgdir}/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 644 config/nvidia-xrun "${pkgdir}/etc/default/nvidia-xrun"
	install -Dm 755 nvidia-xrun "${pkgdir}/usr/bin/nvidia-xrun"
	install -Dm 644 nvidia-xrun-pm.service "${pkgdir}/usr/lib/systemd/system/nvidia-xrun-pm.service"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -dm 555 "${pkgdir}/etc/X11/xinit/nvidia-xinitrc.d"
	install -dm 555 "${pkgdir}/etc/X11/nvidia-xorg.conf.d"
}
