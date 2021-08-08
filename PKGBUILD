# Maintainer: Kookies <kookies@tutamail.com>
_name=wiiu-vc-extractor
_namecap=WiiuVcExtractor
pkgname=$_name-git
pkgver=r111.c78a740
pkgrel=1
pkgdesc="Extracts Wii U Virtual Console roms from dumps created via DDD or dumped from the SNES Mini"
arch=(x86_64)
url="https://github.com/wheatevo/$_name"
license=('GPL3')
depends=(dotnet-runtime)
makedepends=(git 'dotnet-runtime>=5' 'dotnet-sdk>=5')
optdepends=()
provides=($_name)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
       cd "$_name"
       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_name"
	dotnet publish -c Release
	chmod 775 $_namecap/bin/Release/net5.0/publish
}

package() {
	rm "$pkgdir/usr/bin/$_namecap" 2&>/dev/null || true
	mkdir -p "$pkgdir/opt/$_namecap/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -R $_name/$_namecap/bin/Release/net5.0/publish/* "$pkgdir/opt/$_namecap/"
	cd "$pkgdir/usr/bin/"
	ln -s "/opt/$_namecap/wiiuvcextractor"
}	
