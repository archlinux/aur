# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.222.0'
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
sha512sums_x86_64=('5be0b16ed056644570cb10edc78d7e2d1391b2a222c9487f264499593444ec82bcbacd8e3ee88d5429c13a9b3d1e24d9f0fe4f696551048ae40cf33676fe3211'
                   '7c3b776e759e41180654ea66144ea056d772ad33dcf72d8e9593c0147aebcce95a1140e448472f75925997a2194f281e7dc999b9c6c37c15dd1f17f100d568f5')
sha512sums_aarch64=('b1e04b45dbfc6eb644b0ffc251f553bd6ed957627bacd9671ec5ec0d0933b0bb21beb96977bbfaae8aeee83b8713b0357dcf6efc836883362e65d03bdd994208'
                    '23ad5ad4bff0b83c6870e2a13fb4d8dbbc0c90505e21475f7e0bdd7afd262008dcf8a1f27c99910e2ec1bd485d8b0817e9e469f0168251cf937cba8f2d0b0f50')

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
