# Maintainer: Ettore Chimenti <ek5.chimenti @ gmail.com>
pkgname="init-headphone"
pkgver="0.12"
pkgrel=1
pkgdesc="Re-enables headphone jack after sleep/suspend resume on Clevo notebooks"
arch=("any")
url="https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1313904/"
license=('GPL3')
makedepends=('git')
depends=("python")
install=init-headphone.install
source=("git::git+https://github.com/Unrud/init-headphone#tag=v$pkgver"
	"init-headphone.install")
md5sums=('SKIP'
	 '81b2f5e44cd18753e64a084eaff563b5')

build(){
	cd "$srcdir/git"
	./autogen.sh
	./configure  --prefix="$pkgdir/usr/" --with-systemdsystemunitdir="$pkgdir/usr/lib/systemd/system"
	make
	sed "s,$pkgdir,," -i init-headphone.service
}

package() {
	cd "$srcdir/git"
	make install

	mv $pkgdir/usr/{sbin,bin}
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

