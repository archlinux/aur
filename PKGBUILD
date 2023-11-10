# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=slc-cli
pkgver=5.7.3.0
pkgrel=1
pkgdesc='Command line tool to generate projects with Silicon Labs SDK'
arch=('x86_64')
url='https://siliconlabs.github.io/slc-specification'
license=('unknown')
options=('!strip')
depends=('java-runtime' 'python-requests' 'python-websockets' 'python-colorama')
source=("$pkgname-$pkgver.zip::https://www.silabs.com/documents/login/software/slc_cli_linux.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('e33775fef52032b97f31b8cae48936e02e299b2df79c40ce5caf47d08ce02396')

prepare() {
	bsdtar -xpf "$pkgname-$pkgver.zip"
}

package() {
	cd "slc_cli"
	install -d "$pkgdir"/{usr/bin,opt/$pkgname}
	cp -a {bin,lib,slc} "$pkgdir/opt/$pkgname/"
	echo "python3 /opt/$pkgname/slc \$@" > "$pkgdir/usr/bin/slc"
	chmod +x "$pkgdir/usr/bin/slc"
}
