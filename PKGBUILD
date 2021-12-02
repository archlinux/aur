# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=osabie-git
pkgver=r857.f34df35
pkgrel=1
pkgdesc="An esoteric code golfing language"
arch=('x86_64')
url="https://github.com/Adriandmen/05AB1E"
license=('MIT')
makedepends=('elixir')
source=("$pkgname::git+https://github.com/Adriandmen/05AB1E.git#branch=master")
noextract=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	mix local.hex --force
	mix deps.get
	MIX_ENV=prod mix escript.build
}

package() {
	cd "$pkgname"
	install -Dm 755 osabie $pkgdir/usr/bin/osabie
}
sha256sums=('SKIP')
