# Maintainer: Aztec Rabbit <ars.xda@gmail.com>

_pkgname='brainfuck-psiphon-pro-go'
pkgname="${_pkgname}-bin"
pkgver=1.3.210109
pkgrel=1
pkgdesc="Brainfuck Tunnel [Psiphon Pro Go Version. ${pkgver}]"
arch=('x86_64')
url="https://github.com/aztecrabbit/${_pkgname}"
license=('MIT')
depends=('redsocks')
conflicts=(
	"${_pkgname}-git"
)
source=(
	"https://github.com/aztecrabbit/brainfuck-psiphon-pro-go/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
)
md5sums=(
	'3dd336f6a47d17dd6bbef62c363b5258'
)

package() {
	target="${pkgdir}/opt/${_pkgname}"

	install -d -m755 "$target"
	cp -dr --no-preserve='ownership' 'storage' "$target"
	cp -dr --no-preserve='ownership' 'LICENSE' "$target"
	cp -dr --no-preserve='ownership' 'README.md' "$target"
	install -D -m755 'psiphon-tunnel-core' "$target"
	install -D -m755 "$_pkgname" "$target"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
