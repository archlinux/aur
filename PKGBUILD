# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Foxemsx
_gitname=Protonux
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A terminal UI that scans your Steam library and shows Linux compatibility info at a glance automatically"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
        "README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('7c3db2683c39ab3a51a52afa1dae64889df8c06d5b525e66dda75478b4c75c7e'
            '405e7961efe33373721610702605b94843371b5363d5785e9e3df90e928a393b')
sha256sums_x86_64=('bf178a37b2bc8f7f118d648cebdf23f2fb5ea847fd701ef4b6d382f8975278a8')
sha256sums_aarch64=('b37eaeef811f461419e02119b729ea7249be52f1c6ced88fe6bb6095b99f7261')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_gitversion}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
