# Contributor: mihai303

pkgname=rpmdevtools
pkgver=8.7
pkgrel=1
pkgdesc="RPM Development Tools"
arch=('any')
url="https://fedorahosted.org/$pkgname/"
source=("https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.xz")
license=('GPL2')
depends=('python' 'rpm-org')
makedepends=('bash-completion' 'help2man')
md5sums=('e4cc3fcfd527c76bd3f6685a09784bf6')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	            --sysconfdir=/etc
	# Bug in 8.7's rpmdev-bumpspec.1 build
	# see http://pkgs.fedoraproject.org/cgit/rpms/rpmdevtools.git/commit/?id=314247a
	export PATH="$PWD:$PATH"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
