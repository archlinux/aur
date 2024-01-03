# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname"
pkgver=0.8.1
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
sha256sums=('bed004c6aee99a4eb8fa324d5085185b6490850f4fa8276155259c5e4671d97e')

package() {
    cd "${_pkgname}-${pkgver}"
    bun install
    bun build ./update.ts --compile --minify --outfile "${srcdir}/${_pkgname}-${pkgver}/$_pkgname"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
