# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: Stephen Gregoratto <dev at sgregoratto dot me>
pkgname=doas
pkgver=6.3p6
pkgrel=1
pkgdesc="A port of OpenBSD's doas(1), an alternative to sudo(1)"
license=('BSD')
url="https://github.com/slicer69/doas"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=() # bash & pam are dependencies of base
makedepends=('bison')
optdepends=('vi: default editor for vidoas')
backup=('etc/doas.conf'
        'etc/pam.d/doas')
install="doas.install"
changelog="doas.changelog"
conflicts=('opendoas' 'opendoas-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'doas-pam'
				'doas.conf')
sha256sums=('aa6f5d686942d9148506634e7b84af561af2564b689a287434023b1f272c064a'
            'b064704fb3448c3511904c3963b0e167ecf6274aea48afb9c42d452447dfd042'
            '1f28802fad6ae0eaa5b94bb8d945ada923631ddfb7ae63e934962dbe41774976')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 "doas-pam" "$pkgdir/etc/pam.d/doas"
	install -Dm644 "doas.conf" "$pkgdir/etc/doas.conf"
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
	echo "Edit the configuration in /etc/doas.conf"
	echo "by adding your username or other values"
}
