# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=pam-ssh-add
pkgver=268.1
pkgrel=2
pkgdesc='Standalone pam_ssh_add plugin from cockpit'
arch=('x86_64')
url='https://cockpit-project.org/'
license=(LGPL)
makedepends=(json-glib xmlto python docbook-xsl)
depends=(pam libssh openssh systemd)
source=("https://github.com/cockpit-project/cockpit/releases/download/$pkgver/cockpit-$pkgver.tar.xz")
sha256sums=('01baf9a92e5d6f67eb4dcd7b9803192f27ab58b18e9bea5b5acad433b50e7a08')

build() {
	cd cockpit-$pkgver
	./configure --prefix=/usr \
	--disable-pcp \
	--disable-polkit \
	--disable-silent-rules \
	--disable-dependency-tracking \
	--disable-selinux-policy

	make pam_ssh_add.so doc/man/pam_ssh_add.8
}

package() {
	cd "cockpit-$pkgver"
	install -Dm755 pam_ssh_add.so -t "$pkgdir/usr/lib/security/"
	install -Dm755 doc/man/pam_ssh_add.8 -t "$pkgdir/usr/share/man/man8/"
}
