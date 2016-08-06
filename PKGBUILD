# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname="torque"
pkgver=6.0.2
pkgrel=1
buildnr="1469811694_d9a3483"
linknum="3124"
pkgdesc='An open source resource manager providing control over batch jobs and distributed compute nodes'
arch=('i686' 'x86_64')
url="http://www.adaptivecomputing.com/products/open-source/torque/"
license=('custom')
depends=('openssh' 'libxml2' 'tk' 'boost-libs')
makedepends=('make' 'gcc' 'boost')
backup=(var/spool/torque/server_name var/spool/torque/mom_priv/config var/spool/torque/serv_priv/{nodes,serverdb})
options=(!libtool)
install=torque.install
source=("torque-"$pkgver"-"$buildnr".tar.gz"::'http://www.adaptivecomputing.com/index.php?wpfb_dl='$linknum)
md5sums=('df7f1ef5116e01c8290812bc9bd74fe9')

build() {
	cd "$srcdir/$pkgname-$pkgver-$buildnr"
	CPPFLAGS="-DUSE_INTERP_ERRORLINE -DUSE_INTERP_RESULT -Wno-misleading-indentation" ./configure --prefix="/usr" --sbindir="/usr/bin" --disable-gui
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver-$buildnr"
	make DESTDIR="$pkgdir/" install
	# License
	install -D -m644 "${srcdir}/$pkgname-$pkgver-$buildnr/"PBS_License.txt "${pkgdir}/usr/share/licenses/torque/PBS_License.txt"
}

