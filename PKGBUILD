# Maintainer: jialeens <jialeadmin@163.com>

pkgname=dida-git
pkgver=1.0.4.r0.g40a853e
pkgrel=1
pkgdesc="使用electron包装的滴答客户端"
arch=('any')
url="https://github.com/jialeens/dida"
license=("MIT")
groups=()
depends=('electron')
makedepends=('git' 'npm' 'sed' 'gcc')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git"
       "dida.desktop"
	   "dida.sh")
noextract=()
sha256sums=("SKIP"
            "2900c26c1209f94033b94c38ad754aa2941f2acbf681f8c30a04f83b128d3f13"
			"24a3b6e4300741f8184395a9d628076205f249201658a318c1eebaec6f613884")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	npm install 
	npm run package
}

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r --no-preserve='ownership' -- $pkgname/dist/dida-linux-x64/* "$pkgdir/usr/lib/$pkgname"
	install -Dm644 "$srcdir/$pkgname/dida.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/dida.png"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "dida.sh" "$pkgdir/usr/bin/dida"
	install -Dm644 "dida.desktop" -t "$pkgdir/usr/share/applications"
}