# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=erietz
_gitname=nlock
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Make shell commands take turns: named locks with a queue for terminals, cron jobs, scripts and coding agents"

pkgver=0.1.9
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}"{,d})
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('76daf8fbabe85af893f81de2cf67c6dbb344cb8ccd5a3ee08b8e3df85dbc9cde')
sha256sums_aarch64=('0b35554f31bafb961a58a7095a4b985263776079c02f63e13d1c85662de9f022')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 bin/${_appname}* -t "${pkgdir}/usr/bin/"

	install -Dm644 share/man/man1/*.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 share/systemd/user/*.service -t "${pkgdir}/usr/lib/systemd/user/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
