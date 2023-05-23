# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>
pkgname=ghidra-extension-ghidrathon
pkgver=2.1.0
pkgrel=2
pkgdesc="The FLARE team's open-source extension to add Python 3 scripting to Ghidra."
arch=("any")
url="https://github.com/mandiant/Ghidrathon"
license=("Apache")
depends=('ghidra>=10.2' 'python-jep>=4.1.1' 'python>=3.7')
makedepends=('gradle>=7.3' 'unzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mandiant/Ghidrathon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5d52e2cca7ff8626dc82280d94c3b5bdb48e5951ed9ff65f49a7b3652d9f5ed')

_name='Ghidrathon'
_ghidra_dir=$(dirname $(readlink -fe $(which ghidra)))

build() {
	cd "$_name-$pkgver"
	gradle -PGHIDRA_INSTALL_DIR="$_ghidra_dir"
}

package() {
	cd "$_name-$pkgver"
	install -d $pkgdir/$_ghidra_dir/Ghidra/Extensions

	# Extract built archive into destination folder
	unzip -u dist/*.zip -d $pkgdir/$_ghidra_dir/Ghidra/Extensions/

	install -Dm 644 LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
