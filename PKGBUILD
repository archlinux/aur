# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.214.0'
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
sha512sums_x86_64=('e34604a72374a0134a402cf912f112aa4d1ee0a1c0cf3ca31de4df2f5930d4cdd1a5cff680262c3bf9f10d94642d16cb72c6d46c2cf997383f082d4ffb688ce6'
                   'e835a92cd78ae7cfd9d4a8eee49fa5592998cfec2c5533124ac9a2c6545baaa815dc767885e2d0314e78fcd9c72cc943c2bb14b4137f14b207abfe654b4b2601')
sha512sums_aarch64=('af047a9ccb81c27c7cd1c3d747f906ac748b5af08edcf9dab4b16a04350eff173128261d2ae7c23e3cb162562b3b793930d5817d95d3206bf1197ff1a7d971b3'
                    '76f3a0ee08c3a953f99aee6a2871851e808a44cb189759c7e6dff3bda677d26dd2a5dc0ad683c96e43f5944da461748ae21c62642324c8baa0182002201c629f')

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
