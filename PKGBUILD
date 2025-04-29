# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='unsure'
pkgver='0.4.0'
_commit='4f36e11175d172c1969a0256b7204bb1377f6ead'
pkgrel='1'
pkgdesc="Calculate with numbers you’re not sure about"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/filiph/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('dart')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('c8c4d026ddfb11ce0dbca25adc1f84a60c446d90cdc85b233d5272ab5735e239378e11d0a4713a924839b5906da5d95902bfce3974450b0780d5272280444dcf')

_sourcedirectory="$pkgname-$_commit"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get rid of the example directory so its dependencies don't get downloaded
	rm -rf 'example/'

	# Disable analytics
	dart --disable-analytics

	# Download dependencies
	dart pub get
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# Compile the executable
	dart compile exe 'bin/unsure.dart'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Binary
	install -Dm755 "bin/$pkgname.exe" "$pkgdir/usr/bin/$pkgname"

	# License file
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
