# Maintainer: Your Name <youremail@domain.com>
pkgname=process-logger
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="https://github.com/ITAnalyst-JU/process-logger"
license=('unknown')
groups=()
depends=('python-websockets' 'strace')
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname-master.zip::https://github.com/ITAnalyst-JU/process-logger/archive/master.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$pkgname-master/src/frontend"
	npm install
	npm run build
}

package() {
	cd "$pkgname-master/src"
	TARGET="$pkgdir/usr/share/$pkgname"
	mkdir -p "$TARGET"
	cp -r events *.py "$TARGET"
	mkdir -p "$TARGET/frontend"
	cp -r frontend/{index.html,js,css} "$TARGET/frontend"
	chmod +x "$TARGET/main.py"
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "$TARGET/main.py" "$pkgdir/usr/bin/process-logger"
}
