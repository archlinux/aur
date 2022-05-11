# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=manga-sharp
pkgver=0.2.0
pkgrel=2
pkgdesc='CLI manga downloader and reader with lightweight web interface'
arch=(x86_64)
url='https://github.com/LiteracyFanatic/manga-sharp'
license=('MIT')
depends=(dotnet-runtime aspnet-runtime)
options=('!strip')
makedepends=(dotnet-sdk npm git)
source=("git+https://github.com/LiteracyFanatic/manga-sharp#tag=v$pkgver")
sha256sums=(SKIP)

prepare() {
	cd "$srcdir/$pkgname"
	npm install
	mkdir -p src/CLI/wwwroot/assets
	cp node_modules/bulma/css/bulma.min.css src/CLI/wwwroot/assets/
}

build() {
	cd "$srcdir/$pkgname"
	dotnet publish -c Release -r linux-x64 --no-self-contained -o dist src/CLI/
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 dist/manga "$pkgdir/usr/bin/manga"
	install -Dm 544 manga-completion "$pkgdir/usr/share/bash-completion/completions/manga"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
