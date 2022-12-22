# Maintainer: ChenyHsu <bu56fo58@gmail.com>

pkgname=ssh-ldap-pubkey
pkgver=1.4.0
pkgrel=1
pkgdesc="Utility to manage SSH public keys stored in LDAP"
url="https://github.com/jirutka/ssh-ldap-pubkey"
arch=('x86_64')
license=('MIT')
depends=(
	'python'
	'python-ldap'
	'python-docopt'
)
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/jirutka/$pkgname/archive/v$pkgver.tar.gz"
)

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|/etc/ldap.conf|/etc/ssh-ldap-pubkey.conf|g' bin/ssh-ldap-pubkey
}

build() {
        cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
        cd "$pkgname-$pkgver"
        python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	#python setup.py install --prefix=/usr --root="$pkgdir" 
	# not sure if --prefix is needed
	install -m 644 -D etc/ldap.conf \
		"$pkgdir"/etc/ssh-ldap-pubkey.conf

	mkdir -p "$pkgdir"/usr/share/doc/$pkgname
	cp README.md etc/openssh-lpk.schema "$pkgdir"/usr/share/doc/$pkgname/
}

sha256sums=('17790a7e21ea789a87b1a2e692ca87396851b369214863372f8eadf25d4d5e04')
