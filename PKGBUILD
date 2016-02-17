# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname="torque"
pkgver=6.0.0.1
pkgrel=4
buildnr="1449528029_21cc3d8"
pkgdesc='An open source resource manager providing control over batch jobs and distributed compute nodes'
arch=('i686' 'x86_64')
url="http://www.adaptivecomputing.com/products/open-source/torque-resource-manager/"
license=('custom')
depends=('openssh' 'libxml2' 'tk' 'boost-libs')
makedepends=('make' 'gcc' 'boost')
backup=(var/spool/torque/server_name var/spool/torque/mom_priv/config var/spool/torque/serv_priv/{nodes,serverdb})
options=(!libtool)
install=torque.install
source=("torque-"$pkgver"-"$buildnr".tar.gz"::'http://www.adaptivecomputing.com/index.php?wpfb_dl=3001')
md5sums=('95e45adcba1ad6d06c5feec4d0882cf2')

build() {
	cd "$srcdir/$pkgname-$pkgver-$buildnr"
	CPPFLAGS="-DUSE_INTERP_ERRORLINE -DUSE_INTERP_RESULT" ./configure --prefix="/usr" --sbindir="/usr/bin"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver-$buildnr"
	make DESTDIR="$pkgdir/" install
	# License
	install -D -m644 "${srcdir}/$pkgname-$pkgver-$buildnr/"PBS_License.txt "${pkgdir}/usr/share/licenses/torque/PBS_License.txt"
}
