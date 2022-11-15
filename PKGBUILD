# Maintainer: nezu <nezu@nezu.cc>
pkgname=givemebadge-git
_pkgname=givemebadge
pkgver=1.0.5+r6+g96a115c
pkgrel=2
pkgdesc="Pretty simple Discord bot to get the active developer badge"
arch=('any')
url="https://github.com/AlexFlipnote/GiveMeBadge"
license=('MIT')
depends=('python')
makedepends=('git' 'python-pip')
provides=('givemebadge')
conflicts=('givemebadge')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

prepare() {
	cd "$_pkgname"
	export PATH=${HOME}/.local/bin:${PATH}
	pip install -r requirements.txt
}

build() {
	cd "$_pkgname"
	export PATH=${HOME}/.local/bin:${PATH}
	pyinstaller index.py --onefile --icon=assets/logo.ico --name $_pkgname
}

package() {
	cd "$_pkgname"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm755 "dist/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
