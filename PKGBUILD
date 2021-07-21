# Maintainer: shuimo <kudoxu@firefox.com>

pkgname=mubu
pkgver=0.0.3
pkgrel=2
pkgdesc="使用electron封装的幕布客户端"
arch=('any')
url="https://github.com/kudoxu/mubu"
license=("MIT")
groups=()
depends=('electron')
makedepends=('git' 'npm' 'sed' 'gcc')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/kudoxu/mubu/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=("7401ab2891c1c29f47f1b00256a589fc43f82f7c97371a44336b58f33e0ab944")

build() {
	cd "$pkgname-$pkgver"
	npm install 
	npm run package
}
package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r --no-preserve='ownership' -- $pkgname-$pkgver/out/mubu-linux-x64/* "$pkgdir/usr/lib/$pkgname"
	install -Dm644 "$srcdir/$pkgname-$pkgver/mubu.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mubu.png"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/$pkgname-$pkgver/mubu.sh" "$pkgdir/usr/bin/mubu"
	install -Dm644 "$srcdir/$pkgname-$pkgver/mubu.desktop" -t "$pkgdir/usr/share/applications"
}
