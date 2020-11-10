# Maintainer: Mark Austin <ganthore@gmail.com>

pkgname=keysmith-git
pkgver=v0.1.r165.g8d1a88b
pkgrel=1
pkgdesc="An application to generate two-factor authentication (2FA) tokens."
url="https://github.com/KDE/keysmith"
arch=('i686' 'x86_64')
license=('GPL')

depends=('cmake' 'qt5-base')
makedepends=('git' 'cmake')
provides=('keysmith' 'keysmith-git')

options=('!libtool' '!emptydirs')

source=("git+https://github.com/KDE/keysmith.git")

sha256sums=('SKIP')

pkgver() {
  cd keysmith
  git describe --long | sed 's/-/.r/;s/-/./'
}


prepare() {
	cd keysmith
	#patch -p1 -i $srcdir/plymouth-update-initrd.patch
	#patch -p1 -i $srcdir/plymouth-quit.service.in.patch
	#patch -p1 -i $srcdir/plymouth-start.service.in.patch
}

build() {
	cd keysmith
	mkdir -pv build
	cmake -S . -B build -G "Unix Makefiles"
	cd build
	make all
}

package() {
        cd keysmith/build
	make DESTDIR="$pkgdir" install

	#install -Dm644 "$srcdir/arch-logo.png" "$pkgdir/usr/share/plymouth/arch-logo.png"
	#install -Dm644 "$srcdir/plymouth.encrypt_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth-encrypt"
	#install -Dm644 "$srcdir/plymouth.encrypt_install" "$pkgdir/usr/lib/initcpio/install/plymouth-encrypt"
	#install -Dm644 "$srcdir/plymouth.initcpio_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth"
	#install -Dm644 "$srcdir/plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/plymouth"
	#install -Dm644 "$srcdir/sd-plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/sd-plymouth"

	#for i in {sddm,lxdm,slim,lightdm}-plymouth.service; do
	#	install -Dm644 "$srcdir/$i" "$pkgdir/usr/lib/systemd/system/$i"
	#done
	
	#ln -s "/usr/lib/systemd/system/gdm.service" "$pkgdir/usr/lib/systemd/system/gdm-plymouth.service"

	#install -Dm644 "$srcdir/plymouth-deactivate.service" 	"$pkgdir/usr/lib/systemd/system/plymouth-deactivate.service"
	#install -Dm644 "$srcdir/plymouth-start.path" 	"$pkgdir/usr/lib/systemd/system/plymouth-start.path"
	#install -Dm644 "$pkgdir/usr/share/plymouth/plymouthd.defaults" "$pkgdir/etc/plymouth/plymouthd.conf"
}
