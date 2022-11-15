# Maintainer: nezu <nezu@nezu.cc>
pkgname=givemebadge
_pkgname=GiveMeBadge
pkgver=1.0.5
pkgrel=1
pkgdesc="Pretty simple Discord bot to get the active developer badge"
arch=('any')
url="https://github.com/AlexFlipnote/GiveMeBadge"
license=('MIT')
depends=('python')
makedepends=('python-pip')
provides=('givemebadge')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aedd5efae4a9a745dfe70d68deac77bd38e9b963157655a7b1a27d1974354e0d')

prepare() {
	cd "$_pkgname-$pkgver"
	export PATH=${HOME}/.local/bin:${PATH}
	pip install -r requirements.txt
}

build() {
	cd "$_pkgname-$pkgver"
	pyinstaller index.py --onefile --icon=assets/logo.ico --name $pkgname
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
