#Maintainer: digital mystik <dgtl_mystik AT protonmail DOT ch>
#Contributer: shimun <shimun AT shimun DOT net>

pkgname=fido2luks-bin
_pkgname=fido2luks
pkgver=0.2.19
pkgrel=2
pkgdesc="Decrypt your LUKS partition using a FIDO2 compatible authenticator"
arch=('x86_64')
url="https://github.com/shimunn/fido2luks"
license=('MPL-2.0')
provides=('$_pkgname')
conflicts=('$_pkgname')
depends=('cryptsetup')
optdepends=('dracut: booting with 2FA')
backup=('etc/fido2luks.conf')
options=('!strip' '!emptydirs')
validpgpkeys=('0B696CD8BD59C0628C3DC2A487999521848D6CA7')
install=dracut-integration-instructions.install

source=(
	"https://github.com/shimunn/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb"{,.asc}
	"dracut-integration-instructions.install"
)

b2sums=(
	'e21519cdd29cc12026183e492918ef63522fa3cd2870a4f4ddf0bf9e2040f8d55de88448d3106c76a274995d30bf3e061bde40a7a9058a7e6e9ec492d836ceda'
	'SKIP'
	'0f4cba3368e3f713064d890c8e3688721aa8dc7c59e463d20c2a00db650d71a2837c5229becd43e31b4b590650390685930d86056eab62c251220854b7a3983b'
)

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/share/doc/fido2luks/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd ${pkgdir}
	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
}
