# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=firejail-apparmor
pkgver=0.9.44.6
pkgrel=1
pkgdesc="Apparmor support for Firejail"
arch=('i686' 'x86_64')
url="https://firejail.wordpress.com/"
license=('GPL2')
depends=('apparmor-profiles' 'apparmor-utils')
provides=('firejail')
conflicts=('firejail')
source=("https://sourceforge.net/projects/firejail/files/firejail/firejail-0.9.44.6.tar.xz/download")
sha1sums=('8e86fdd17f9e37ea623498550b2b201201c788d3')



build() {
	cd ${srcdir}/firejail-$pkgver
	# edit firejail.config to enable defaults
    sed -i 's/# bind yes/bind yes/g' etc/firejail.config
    sed -i 's/# chroot yes/chroot yes/g' etc/firejail.config
    sed -i 's/# chroot-desktop yes/chroot-desktop yes/g' etc/firejail.config
    sed -i 's/# file-transfer yes/file-transfer yes/g' etc/firejail.config
    sed -i 's/# network yes/network yes/g' etc/firejail.config
    sed -i 's/# overlayfs yes/overlayfs yes/g' etc/firejail.config
    sed -i 's/# private-home yes/private-home yes/g' etc/firejail.config
    sed -i 's/# remount-proc-sys yes/remount-proc-sys yes/g' etc/firejail.config
    sed -i 's/# seccomp yes/seccomp yes/g' etc/firejail.config
    sed -i 's/# userns yes/userns yes/g' etc/firejail.config
    sed -i 's/# whitelist yes/whitelist yes/g' etc/firejail.config
    sed -i 's/# x11 yes/x11 yes/g' etc/firejail.config
    sed -i 's/# xephyr-window-title yes/xephyr-window-title yes/g' etc/firejail.config
    # configure apparmor support
	./configure --prefix=/usr --enable-apparmor
	make
}


package() {
	cd ${srcdir}/firejail-$pkgver
	make DESTDIR="$pkgdir/" install
}

