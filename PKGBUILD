# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=sgdboop
pkgver=1.3.1
pkgrel=2
pkgdesc="A program used for applying custom artwork to Steam, using SteamGridDB. Supports both Windows and Linux, written completely in C."
arch=('x86_64')
url="https://www.steamgriddb.com/boop"
_repo_url="https://github.com/SteamGridDB/SGDBoop"
license=('Zlib')
depends=('shared-mime-info')
makedepends=('make' 'gcc14' 'libcurl-gnutls')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$_repo_url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a62997fe8aa355486f691659abfd9588c733b32b88b028c02a022234a677752')

_dir_name="SGDBoop-$pkgver"

build() {
	cd "$_dir_name"
	export CC=gcc-14
	export CXX=g++-14
	make
}

package() {
	cd "$_dir_name"
	# Executable
	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "linux-release/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
	
	# Desktop file
	install -Dm644 "linux-release/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
	
	# Mime or sumthing idk
	install -dm755 "$pkgdir/usr/share/mime/packages"
  install -m644 "com.steamgriddb.SGDBoop.appdata.xml" "$pkgdir/usr/share/mime/packages/x-$_pkgname.xml"

	# License
	install -dm644 "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
