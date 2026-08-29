# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unkn0wn-root
_pkgname=resterm-runner
pkgname=${_pkgname}-bin
pkgver=0.2.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='Headless CLI for Resterm - Automate API testing with workflows, assertions, environment diffs, scripting, and SSH support'
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
optdepends=("${_pkgname%-runner}")

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}")

sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            'dab39a7dea327101e0660c2db3e6d6f7dbaead59b3b7f6564ea9834a0864ac89')
sha256sums_x86_64=('1b8886aeb354af1b4789aba3487075058505ae4f5d150a9aff2718f5c4c5d133')
sha256sums_aarch64=('a854ff24cf34940b25acc67da3aa60c9541189d7d5b8d4892d6727cb9d0d6bbc')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
