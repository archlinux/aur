# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=pam-ssh-add
pkgver=304
pkgrel=1
pkgdesc='Standalone pam_ssh_add plugin from cockpit'
arch=('x86_64')
url='https://cockpit-project.org/'
license=(LGPL)
makedepends=(json-glib xmlto python docbook-xsl)
depends=(pam libssh openssh systemd)
source=("https://github.com/cockpit-project/cockpit/releases/download/$pkgver/cockpit-$pkgver.tar.xz")
sha256sums=('a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b8b42a802977e391ce9')

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
