# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=andersondanilo
_gitname=pomodoro-time-chamber
_appname=ptc
pkgname=${_gitname}-bin
pkgdesc="A terminal pomodoro timer with a task list, written in Rust with ratatui. It is scriptable with Lua plugins."

pkgver=1.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('4d72acf9fa1f0010c63ff4ba3563ed46af25af836821e203475f6c83079761f1')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
