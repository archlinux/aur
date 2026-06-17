# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.1.10
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'xz' 'bzip2' 'openssl')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"USAGE-${pkgver}.md::${_ghurlraw}/USAGE.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('df1be9f96f96d9066b3ae1c2c00b1dc65d7b1a31490ff3ae499080b51c170442'
            '7c371205b436866fba7fa46df058e9e26e7672cac51ce5b3f1a572915873a663'
            'f2be9195b5ecdd8f2b71db80d4794361f90a2bdb91894f3c811f025c6578db5b')
sha256sums_x86_64=('5dedb05f6bfb5edadf58698d9afbd8e1f831121df6c8abab578548b64c22e1d4')
sha256sums_aarch64=('3bdcb64ed43d1fb6a86b962da0730d892e2173b6ca6f0ec25ec2863ce998bc47')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
