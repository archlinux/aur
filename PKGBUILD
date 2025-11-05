# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgsuffix=bin
_pkgauthor=abenz1267
_pkgname=elephant
_pkgproviders=(websearch unicode todo symbols runner providerlist menus files desktopapplications clipboard calc archlinuxpkgs bluetooth windows snippets nirisessions bookmarks)

pkgbase=${_pkgname}-${_pkgsuffix}
pkgname=(${_pkgname}-all-${_pkgsuffix} ${_pkgname}-${_pkgsuffix} $(for provider in ${_pkgproviders[@]}; do echo ${_pkgname}-${provider}-${_pkgsuffix} ; done))

_packages=(${pkgname[@]})

pkgver=2.14.3
pkgrel=1
_pkgvername=v${pkgver}

pkgdesc="general purpose datasource and executor"

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

depends=("glibc")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}.tar.gz"
               $(for provider in ${_pkgproviders[@]}; do echo "${provider}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${provider}-linux-${_barch[0]}.tar.gz" ; done))
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b7588cd186b1e534a5fafe14578f88685daae66abae7be582beead897df5d077')
sha256sums_x86_64=('66158d86472d258e6bfa7de267bc4ca670fc2c805f42b7968bff9c258b415c11'
                   'a563ac37c9a4d67394583be5f5e01c850ed57abf97fe41efa2097cd12b5738bc'
                   '70d4e21efc2c5fe3ca3ee34222a65043f3372c7e8ec68ce82a0238c454652d1f'
                   '636edf184b374c30c756ee11b507e29a9b26005238035de9578d5341072c18ac'
                   '5ae702c4771ad7575cc6fac2b235b352596b74e08b87dccb66445778a7c2fd2a'
                   '361820f885da3df682d09698dd13da02251847c2e6cb31aaed30b4680e9bf03f'
                   '06a9ad2280a142f22d30e28170876ed8c838a0da9d6aa2edb56773ccde4d7c91'
                   'efbcf13c0d40fcfd9abf536e802ad4abeb45169062b5178d9380069cdaa0f75d'
                   '7372e86df08c0f371cdf1124264b5832041896886baf8d1b096d658cdf51a295'
                   '17b0325cfbe402ada28cbee0adb6b6755ca4156477bf69a600ff4c09bbd7b936'
                   '0ec59217fc94400a39fe8853debc6ab91bc83a6619686a753d503d5fb5b9c2c4'
                   '55547402310afdc0305fec12feab5b602e0913090471eaf754c0a62925101a1f'
                   'b0122bf8a07c7a84476330b88e13869a29c41adbc5a722cfdfa9d4fed0fdc393'
                   '714302c0fa053a8427225381f5ca174fb40cc451d6d5afe8ac33281c593d3030'
                   '5205ba4603b850be50cf1c825e666947650c45ce1471c0f3dd25becb2aba4b62'
                   'f924086d8e8de1b456d496a1b4281e6ab3f7943a5181279d32394df0a43d1cfe'
                   'b8cb205ad958de32dc92e579cb9f5bdc59a8f15b79a4328f595267d99126c10a'
                   '4f17cf479c9406861ee773c1e02c56b7370e50e93c3367407728471db7e8e509')

case $CARCH in
    ${arch[0]})
        _CARCH=${_barch[0]}
        ;;
esac


package_elephant-all-bin() {
    pkgdesc="elephant + all official elephant providers"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends=("${_packages[@]:1}")
}

package_elephant-bin() {
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")
    depends+=()
    optdepends+=("${_packages[@]:2}")

    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-websearch-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-unicode-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-todo-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-symbols-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-runner-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-providerlist-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-menus-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-files-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-desktopapplications-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-clipboard-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "wl-clipboard" "imagemagick")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-calc-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "libqalculate")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-archlinuxpkgs-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-bluetooth-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-windows-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-snippets-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "wtype")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-nirisessions-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "niri")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-bookmarks-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "jq" "sqlite")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
