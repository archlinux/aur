# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.210.2'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - binary version'
arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=(
	"$pkgname-$pkgver-x86_64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux64-v$pkgver.zip"
	"$pkgname-$pkgver-parser-x86_64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/lib${_pkgname}parser-linux64-v$pkgver.zip"
)
source_aarch64=(
	"$pkgname-$pkgver-aarch64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64-v$pkgver.zip"
	"$pkgname-$pkgver-parser-aarch64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/lib${_pkgname}parser-linux-arm64-v$pkgver.zip"
)
source=(
	"$pkgname-$pkgver-bash-completion::https://github.com/facebook/$_pkgname/raw/v$pkgver/resources/shell/bash-completion"
	"$pkgname-$pkgver-LICENSE::https://github.com/facebook/$_pkgname/raw/v$pkgver/LICENSE"
)
sha512sums=('50dd81cc39c67bc463e51a2d492119a2533548cb7e3f765e02cf9ada999397710351a1c4deadc4ffc59f4c2347b2e6ba2d4c42cbb63026ef48d50a2f2f5ee87a'
            '3b8288e5dac996da44bd81b0eb1d96905c4b90ad9154f3d29d073c96890b75cd281fa03af0b77f331dbec239d341363b5f9b328bafea0d4b8d0a3e900d150f80')
sha512sums_x86_64=('5887869f1a7ecf949273377a24ecd6d278e138db8695bc6e0b9c76472c1dbf2c12b0e819fe1afb6bca9ca3a5d7cad00d3bf8809393ebf9c4bf6184099a7e97a3'
                   '7cabdfa69910434af902cfa4ea6d9ed1555733a16edfb13b140df28de3877803c514624a83b7b300b3817d24473d285d7a4d50344c3bcff8763aafb2c19e4c62')
sha512sums_aarch64=('4c7cdb1d1a3762db6fe67e6034a39de2627ea9d3cdbca102fda1c8eda16472db295b3c5b410aa1568c9447eff6ef27ec61bc15b59a9003d42fbfa0fd713f8bc0'
                    '2070803d9609e5175a7049ef8d553ff01dfd63ecf9d4e49bb1fde07d44b2b78853733936ddf50597ee6b1048446380cec7121ce3467c6dccc280a5067c979328')

package() {
	cd "$srcdir/"

	# Binary
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Parser library files
	install -dm755 "$pkgdir/usr/lib/ocaml/${_pkgname}parser/"
	install -Dm644 "lib${_pkgname}parser/include/${_pkgname}parser/"* "$pkgdir/usr/lib/ocaml/${_pkgname}parser/"

	install -dm755 "$pkgdir/usr/lib/"
	install -Dm644 "lib${_pkgname}parser/lib/"* "$pkgdir/usr/lib/"

	# Misc files
	install -Dm644 "$pkgname-$pkgver-bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
