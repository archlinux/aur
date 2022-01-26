# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=reddio
pkgver=0.50
pkgrel=1
pkgdesc='A command-line interface for Reddit written in POSIX sh'
arch=('any')
url='https://gitlab.com/aaronNG/reddio'
license=('MIT')
conflicts=('reddio-git')
depends=('curl' 'jq')
optdepends=('gnu-netcat: for authentication'
            'openbsd-netcat: for authentication'
	    'dash: POSIX compliant shell'
	    'ksh: POSIX compliant shell')
source=("https://gitlab.com/aaronNG/$pkgname/-/archive/v.$pkgver/$pkgname-v.$pkgver.tar.gz")
sha512sums=('0148c03f673fb5cdee78683eda19d3ac1098c03cc6e54e02bf5183813ff6769075878ec7295509dc3478b553e66c780ec96f78451ca2449aa9e71f8c06a1c413')

prepare() {
	sed -i 's|usr/local|usr|g' "$pkgname-v.$pkgver/reddio"
}

package() {
	cd "$pkgname-v.$pkgver"
	make PREFIX='/usr' DESTDIR="$pkgdir" install

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
