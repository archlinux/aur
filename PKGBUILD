# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=CadenFinley
_appname=CJsShell
_execname=cjsh
pkgname=${_execname}-bin
pkgdesc="POSIX shell scripting meets Modern Shell Features"

pkgver=1.4.15
pkgrel=1
_appversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-gnu-x86_64' 'linux-gnu-arm64')

_ghurl="https://github.com/${_appauthor}/${_appname}"
_ghurlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/${_appversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip')

install="${_execname}.install"

source=("WHAT-TO-KNOW-${pkgver}.md::${_ghurlraw}/docs/getting-started/what-to-know.md"
        "HOOKS-${pkgver}.md::${_ghurlraw}/docs/reference/hooks.md"
        "EDITING-${pkgver}.md::${_ghurlraw}/docs/reference/editing.md"
        "COMMANDS-${pkgver}.md::${_ghurlraw}/docs/reference/commands.md"
        "FEATURES-${pkgver}.md::${_ghurlraw}/docs/reference/features.md"
        "COMPLETIONS-${pkgver}.md::${_ghurlraw}/docs/reference/completions.md"
        "NON-POSIX-FEATURES-${pkgver}.md::${_ghurlraw}/docs/reference/non-posix-features.md"
        "LANGUAGE-COMPATIBILITY-${pkgver}.md::${_ghurlraw}/docs/reference/language-compatibility.md")
source_x86_64=("${_execname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_appversion}/${_execname}-${_appversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_execname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_appversion}/${_execname}-${_appversion}-${_barch[1]}.tar.gz")
sha256sums=('1fe29b16df9b061a2c03c6ca8a6371f811b9d5e382b46e2a6f773ce126cf3686'
            '271ddb6d44b38c83cd2eb69739b74f18935a90638deb39a06ab299b265a93c88'
            '38eb494f015aa6005db3f44166d0ef1a9506bcf40b02675c5aedce8895b582fa'
            '0aeb9ed2295082dddd82ee8a194a6ceb2f78664aa8d01aff0faa836d0cce476e'
            '64dbec6a47cc56f4ab6a09d7c448314eedb34e08009dae2b6b93a832d2011f3b'
            '60a2377bd4917712d11a61addd67460fe4410dae562a701bc4921077de7451b8'
            '5bc433042212436482823d29c6d537068f7c4de7633745acb3777751d28a3f1a'
            '3889766b8eba4a461cc768c3f52000fe501b23adf99535c9f8fb1c8ccf8aebaf')
sha256sums_x86_64=('45900892c44d40c91527147708ae1f9db79ebb5e8f11a63674b5c280ff60769b')
sha256sums_aarch64=('1ce757e8070f8e73361e159c754d27619dfe364e21fc9520e6f7bad7ec531059')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_execname}-${_appversion}-${_CARCH}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "../HOOKS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/HOOKS.md"
	install -Dm644 "../EDITING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/EDITING.md"
	install -Dm644 "../COMMANDS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
	install -Dm644 "../FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"
	install -Dm644 "../COMPLETIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMPLETIONS.md"
	install -Dm644 "../WHAT-TO-KNOW-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/WHAT-TO-KNOW.md"
	install -Dm644 "../NON-POSIX-FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NON-POSIX-FEATURES.md"
	install -Dm644 "../LANGUAGE-COMPATIBILITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/LANGUAGE-COMPATIBILITY.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
