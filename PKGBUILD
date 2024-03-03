# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64
pkgver=1.1.1
pkgrel=1
pkgdesc="A game made in under 2 weeks for Celeste's 6th Anniversary"
arch=(x86_64)
url="https://github.com/ExOK/Celeste64"
license=('custom:celeste64')
groups=()
depends=()
makedepends=('dotnet-sdk')
replaces=()
backup=()
options=('!strip')
source=("Celeste64-$pkgver.tar.gz::https://github.com/ExOK/Celeste64/archive/refs/tags/v$pkgver.tar.gz"
				'celeste64.desktop')
sha256sums=('SKIP'
            '9906284626f846e34c55807a60126b2bf034697adab5ef15c2665e18f5abd795')

prepare() {
	cd "$srcdir/Celeste64-$pkgver"
	dotnet restore
}

build() {
	cd "$srcdir/Celeste64-$pkgver"
	dotnet build -c Release
}

package() {
	cd "$srcdir/Celeste64-$pkgver"
	dotnet publish -c Release --no-build -o "$pkgdir"/opt/celeste64
	cp -r Content "$pkgdir"/opt/celeste64
	install -Dm 644 "$srcdir"/celeste64.desktop -t "$pkgdir"/usr/share/applications
}
