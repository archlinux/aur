# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=sgdboop
pkgver=1.4.4
pkgrel=1
pkgdesc="A program used for applying custom artwork to Steam, using SteamGridDB. Supports both Windows and Linux, written completely in C."
arch=('x86_64' 'aarch64')
url="https://www.steamgriddb.com/boop"
_repo_url="https://github.com/SteamGridDB/SGDBoop"
license=('Zlib')
depends=('shared-mime-info' 'gtk3')
makedepends=('make' 'gcc' 'libcurl-gnutls')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$_repo_url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10c15093137f9e7f673cde88fbb688734bc161e4479522c26043618eb2c34d82')
options=('!debug')

_dir_name="SGDBoop-$pkgver"

build() {
	cd "$_dir_name"
	make
}

package() {
	cd "$_dir_name"

	# Executable
	install -Dm755 "SGDBoop" "$pkgdir/usr/bin/SGDBoop"
	
	# Desktop file
	install -Dm644 "res/linux/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"

    # AppStream metadata
    install -Dm644 "com.steamgriddb.SGDBoop.appdata.xml" "$pkgdir/usr/share/metainfo/com.steamgriddb.SGDBoop.appdata.xml"

	# License
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
