# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Sasha Khamkov <sanusart@gmail.com>
# Contributor: xgdgsc <xgdgsc at gmail dot com>

pkgname=gisto
_pkgname_capital=Gisto
pkgver=1.13.4
pkgrel=1
pkgdesc='Gisto is a code snippet manager that runs on GitHub Gists and adds additional features such as searching, tagging and sharing gists while including a rich code editor.'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('MIT')
builddepends=(npm)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify)
install=${pkgname}.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('532c4c519eccef3f049db277c569761594a407863b0db340ca2fbe3c35f67100f932beaf60a8db062cce6ca7c6ee44b8cba73e12321f0e14fd8ed435331fe6a0')

prepare() {
	cd "$_pkgname_capital-$pkgver"
	npm ci --no-audit --progress=false --cache "$srcdir/npm-cache"	

}

build() {
	cd "$_pkgname_capital-$pkgver"
	cross-env NODE_ENV=production npm run start:prod
        npx electron-builder build --linux pacman --x64 --publish=always
}


check() {
	cd "$_pkgname_capital-$pkgver"
	npm run test
}


package() {
	exit 1
}
