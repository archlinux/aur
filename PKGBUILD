# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=steganogram
_pkgname=stegano-rs
_appname=${_pkgname%-rs}
pkgname=${_pkgname%-rs}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG and WAV format via LSB Encoding."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname%-rs}")
conflicts=("${_pkgname%-rs}")
makedepends=('help2man')

changelog="changelog.md"

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '5abd67e58915b32aa1f38dbe42b5658a1c1aad76db12b2a163685f80b2a83a37')
sha256sums_x86_64=('e9993faca49f7987a98c38fc3c29dedd2d95be255d3192d7dab92fddbac6b262')
sha256sums_aarch64=('d694f754972061d8aef94a4cbe0d3651e4c238662c900acdf391edc7bde7090b')


build() {
	cd "${srcdir}/" || exit

	help2man "./${_appname}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_appname}.1.gz"
}
