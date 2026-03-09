# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="md4x"
pkgname="${_pkgname}"
pkgver=0.0.25
pkgrel=1
pkgdesc="Fast and small markdown parser and renderer"
arch=('any')
url="https://github.com/unjs/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('zig')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('5acdd4e918f6fbdbafa3ed71398120429fab5eb4eab0d95f825c5cc85e5b3748')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
	zig build
}

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}/zig-out/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "$srcdir/$_pkgname-$pkgver"/LICENSE.md "$pkgdir/usr/share/doc/${_pkgname}"
    install -Dm644 "$srcdir/$_pkgname-$pkgver"/README.md "$pkgdir/usr/share/doc/${_pkgname}"
}
