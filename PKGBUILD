# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=1.11
pkgrel=1
pkgdesc='A tool for checking common errors in rpm packages.'
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('cpio' 'desktop-file-utils' 'python' 'rpm-org')
makedepends=('bash-completion')
checkdepends=('flake8' 'python-pytest')
optdepends=('appstream-glib: for AppData file validation'
            'python-magic: for file type detection'
            'python-pyenchant: for spell checking')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('2642bb6f08f6e2a2f2c0fe9f07634d49')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	make COMPILE_PYC=1
}

# Tests need a non-empty RPM database on the system
#check() {
#	cd "$pkgname-$pkgver"
#	make FLAKE8=true check
#}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install

	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
