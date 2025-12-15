# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=patrykgruszka
_pkgexec=how
_pkgname=${_pkgexec}-cli
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Lightweight AI assistant for your CLI — turns 'WTF do I type?' into commands"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Unlicense')

depends=('glibc')
provides=("${_pkgexec}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux_${_barch[2]}.tar.gz")
sha256sums=('1f6bd58108aebfa708d56be1cbaca3ad2d83f899bef9b7b9ebd4584a5889aa63'
            '6f9a2fb009225de5cca1c2a24dfed7a68bc22657e455b4a3d63f065258b455d1')
sha256sums_x86_64=('f247a48e574e8d2cbc6b853ec42e4a7cb9d1c306537c31e6f0781385f078dc0c')
sha256sums_i686=('930fdd1a644f568d6f338fce691956923ac8bc6b76ea9ee08a156b88700adb60')
sha256sums_aarch64=('11156d4840abfd72628f4e630624c01539368a573d47dca59f1f80b2b7b45b49')

case ${CARCH} in
        ${arch[0]})
                _CARCH="${_barch[0]}"
                ;;
        ${arch[1]})
                _CARCH="${_barch[1]}"
                ;;
        ${arch[2]})
                _CARCH="${_barch[2]}"
                ;;
esac

BIN_FOLDER="linux_${_CARCH}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
