# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.211.0'
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
sha512sums_x86_64=('751ef95380a1982104388eea3405a4a2b0d90d3ffd9e759d18d9a308117951e56ec92d32a93d0ce7cc66e01daabb9cefa938ddf5398e0a8f6a44cd22878d0717'
                   'be18cb76b5126088f216b592715ce98fae4dfcb358c59b3103220a68bd27ad87cb671d889876c7a8afc72031736502d9ee89cc54b5ef38891333d86df5eee711')
sha512sums_aarch64=('d8c32c2f5f4c71785ae66a082affa776288db83b8d01c2c4699fa81b32bc07f399b04dcf2e5f040b5327b6e757a760fd1b9934aed2bb83dd1e644407ecc0b9c7'
                    '33d1cfe74d8ed5c62a4724f9337ca7d8b7f70cabc14bc1d08ca7b72d2fcb4b2ac000d8d086ef69b74860905357cd5ec568bb9b1076c18b29cc6990023fe320ac')

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
