# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=litocpp
_gitname=lito
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Module-first C++ build tool with manifest."

pkgver=0.8.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'zstd' 'gcc' 'lua')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('5ac09bfe493443b79e86f98dea6b46141503946d35117fea2647cbd3f2a297c9')
sha256sums_x86_64=('9172b87a8bfc78aa508c2ca85a1f4b95b7c8d669bc4d94ee0dad3e1b9b1d9448')
sha256sums_aarch64=('ebe8a4e2782a5ffd81fbbb0c7f799a7112bd8d3075bcca90f61d42e749ea4684')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/"

	install -Dm755 bin/${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 share/${_appname}/*.schema* -t "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 ../README-${pkgver}.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 share/licenses/${_appname}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
