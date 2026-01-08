# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgsuffix=bin
_pkgauthor=abenz1267
_pkgname=elephant
_pkgproviders=(websearch unicode todo symbols runner providerlist menus files desktopapplications clipboard calc archlinuxpkgs bluetooth windows snippets nirisessions bookmarks 1password)

pkgbase=${_pkgname}-${_pkgsuffix}
pkgname=(${_pkgname}-all-${_pkgsuffix} ${_pkgname}-${_pkgsuffix} $(for provider in ${_pkgproviders[@]}; do echo ${_pkgname}-${provider}-${_pkgsuffix} ; done))

_packages=(${pkgname[@]})

pkgver=2.18.0
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
            '77c380f4172541442054e2c23c2c0c1d0184b453ee52a26e352c1460972b65f1')
sha256sums_x86_64=('83a470efd0298f79b045a497f587ef8a45481fbe2d0a2e70e1d0b990dcb7feba'
                   '7226c41cf966c5030ed9f52f143b32f1a41a7926056a50a3357d84216eecdddd'
                   'a874c3c2e30dc0ae34d1b7947cd6651dfefe1fbb0a7d240cc8b25cfbc45e9c3d'
                   '1198e6bf130f248d1b112445b57d9f9c8cf304a7b849ac4b44791decbcb574b6'
                   'eb3dff3c9dc8d85752b60eb442ce2ec6e6cf6040508fd6129e59ea98314630c5'
                   '75c0b2a424f1777154acec6b0226260a11e809ac10c2a56cc574b9ef94c81996'
                   'feb8027d232897096555e74efb4e666e0865052289ccd804ca36b8880ca5d4e9'
                   'e53fe114cbd78ea4725787e83abcae47f8fca0b48fab8cce0e6f2cc0cd26c370'
                   'f1a84b22bf4ae704a2b26285b14d2febabb7db359ca3fb65fe3c5b0bd43e8261'
                   'afb6f4fb235788a6080f694438a7fe5bf4031ef3ff0fb3adfb5bd661ab346b13'
                   '4cae4c6dff5085c7b3835881a8bd7ad0bd103c4469d7c6878e04c7f8075036a4'
                   'c09d170a09f9bfe31a393acd8022ce5552886ef5098bac1d03c97ff5ec143148'
                   '6fea097dfa12c46256eb2ad7b89be6dc30cdcaa517376b7d32c0ed47e5c60569'
                   '275d8835f3ba39b6eac4afd84e4817a793817ffe9d546035fc86389cd69caf60'
                   '2263da87a7c0577ad097ba842e828d1c846bbbbfc0aa139c01c98ae286a94477'
                   '7d19821182cddbdeb49a0af85e82b5a8f98d89b474ba2b3925c678af08fb9e60'
                   '7cfc16fc92aa66d536b729d9d26ff7a3e80bdfc6f2851ff4253a61652f9f0297'
                   '6a673fdaeac4628b8e08a0da814b296f42f0194b4a720beb1bbd66cd4caa841c'
                   'f3ad492188732d8466dca72b40e2d8950abf7f40a8cc0548c540c71be7e1c348')

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

package_elephant-1password-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "jq" "sqlite")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

