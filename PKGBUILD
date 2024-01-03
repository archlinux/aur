# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname"
pkgver=0.7.0
pkgrel=1
pkgdesc="Tool to help you update your Ollama models"
arch=('any')
url="https://github.com/thatonecalculator/ollamamodelupdater"
license=('MIT')
makedepends=('git')
optdepends=(
    'ollama: Ollama'
)
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v"$pkgver".tar.gz")
noextract=()
options=(!strip)
sha256sums=('8a23b54011bb147371b3c5c923be2e8fdf1a308b2cb58983d47bc07979c35e8f')

package() {
    cd "${_pkgname}-${pkgver}"
    bun install
    bun build ./update.ts --compile --minify --outfile "${srcdir}/${_pkgname}-${pkgver}/$_pkgname"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
