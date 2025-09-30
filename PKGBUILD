# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin)
pkgver=1.0.9
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="general purpose datasource and executor"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
optdepends=('elephant-providerlist: providerlist provider'
            'elephant-desktopapplications: desktopapplications provider'
            'elephant-archlinuxpkgs: archlinuxpkgs provider'
            'elephant-calc: calc provider'
            'elephant-clipboard: clipboard provider'
            'elephant-files: files provider'
            'elephant-menus: menus provider'
            'elephant-runner: runner provider'
            'elephant-symbols: symbols provider'
            'elephant-todo: todo provider'
            'elephant-unicode: unicode provider'
            'elephant-websearch: websearch provider')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("elephant-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/elephant-linux-${_barch[0]}.tar.gz"
               "websearch-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/websearch-linux-${_barch[0]}.tar.gz"
               "unicode-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/unicode-linux-${_barch[0]}.tar.gz"
               "todo-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/todo-linux-${_barch[0]}.tar.gz"
               "symbols-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/symbols-linux-${_barch[0]}.tar.gz"
               "runner-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/runner-linux-${_barch[0]}.tar.gz"
               "providerlist-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/providerlist-linux-${_barch[0]}.tar.gz"
               "menus-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/menus-linux-${_barch[0]}.tar.gz"
               "files-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/files-linux-${_barch[0]}.tar.gz"
               "desktopapplications-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/desktopapplications-linux-${_barch[0]}.tar.gz"
               "clipboard-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clipboard-linux-${_barch[0]}.tar.gz"
               "calc-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/calc-linux-${_barch[0]}.tar.gz"
               "archlinuxpkgs-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/archlinuxpkgs-linux-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b52cbce3fbd7f99501d766922db595241574bd07d93316e8a9d2cf418a608e3a')
sha256sums_x86_64=('5aea83d0bc1e21ecaed13c62e7315be062aa64c716488257079d319770ac52d5'
                   'eba672909144e78a78f81f36b8e9bce4eead55e8417bab2c2cc4257150c6bd51'
                   'af3402a07c8b794fcb97b0a9fdef6a5ab4cbc800047bc741d410adad3fbff6a9'
                   '54e62a407723b47215ee09ca3805c7155b58079b763afcae8b1900659d8f887e'
                   'f9f8192d0638d46cb775f48ed0d8a326bbda70aa979d2d1f26828a6d45feb502'
                   '4dd379042f37484ddba82516d5b9c42376ec6ede6f9dbcf2be23b5072e259ee7'
                   'da237b3ba41bd99361ff2c71c1d358f24d691afabc82211b0dd70cb00cd28336'
                   '54c78c2c4ff7355309db0645422b18d01083ccc00e19ab5291280359b7315b98'
                   'd8882d1e709df3b35e3a705f12df5ad8542bbc212896ae85615197171d6f670e'
                   '6425ba4f3c717a07510429aa65f292e7451f290aa75c3a6137924e36ff068730'
                   'f1ee929645ea4b95c33f73e215747f9e87b130a38a73172ab1a3ac6e58c8ac91'
                   '43ea179ef3db49ba106842fc41ac76b51cd0edb795bc0b257ec8517e45145fe4'
                   '4ae61ba454bafd9d9affe9a0c150da301c543b30f5cfe70efe4b3d13ae9f137d')

case $CARCH in
    ${arch[0]})
        _CARCH=${_barch[0]}
        ;;
esac

package_elephant-bin() {
    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-websearch-bin() {
    pkgdesc='websearch provider for elephant'

    conflicts=("${_pkgname}-websearch")
    provides=("${_pkgname}-websearch")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "websearch-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/websearch.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-unicode-bin() {
    pkgdesc='unicode provider for elephant'

    conflicts=("${_pkgname}-unicode")
    provides=("${_pkgname}-unicode")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "unicode-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/unicode.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-todo-bin() {
    pkgdesc='todo provider for elephant'

    conflicts=("${_pkgname}-todo")
    provides=("${_pkgname}-todo")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "todo-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/todo.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-symbols-bin() {
    pkgdesc='symbols provider for elephant'

    conflicts=("${_pkgname}-symbols")
    provides=("${_pkgname}-symbols")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "symbols-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/symbols.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-runner-bin() {
    pkgdesc='runner provider for elephant'

    conflicts=("${_pkgname}-runner")
    provides=("${_pkgname}-runner")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "runner-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/runner.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-providerlist-bin() {
    pkgdesc='providerlist provider for elephant'

    conflicts=("${_pkgname}-providerlist")
    provides=("${_pkgname}-providerlist")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "providerlist-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/providerlist.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-menus-bin() {
    pkgdesc='menus provider for elephant'

    conflicts=("${_pkgname}-menus")
    provides=("${_pkgname}-menus")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "menus-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/menus.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-files-bin() {
    pkgdesc='files provider for elephant'

    conflicts=("${_pkgname}-files")
    provides=("${_pkgname}-files")
    depends+=("${_pkgname}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "files-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/files.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-desktopapplications-bin() {
    pkgdesc='desktopapplications provider for elephant'

    conflicts=("${_pkgname}-desktopapplications")
    provides=("${_pkgname}-desktopapplications")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "desktopapplications-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/desktopapplications.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-clipboard-bin() {
    pkgdesc='clipboard provider for elephant'

    conflicts=("${_pkgname}-clipboard")
    provides=("${_pkgname}-clipboard")
    depends+=("${_pkgname}" "wl-clipboard")

    cd "${srcdir}/" || exit

    install -Dm755 "clipboard-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/clipboard.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-calc-bin() {
    pkgdesc='calc provider for elephant'

    conflicts=("${_pkgname}-calc")
    provides=("${_pkgname}-calc")
    depends+=("${_pkgname}" "libqalculate")

    cd "${srcdir}/" || exit

    install -Dm755 "calc-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/calc.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-archlinuxpkgs-bin() {
    pkgdesc='archlinuxpkgs provider for elephant'

    conflicts=("${_pkgname}-archlinuxpkgs")
    provides=("${_pkgname}-archlinuxpkgs")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "archlinuxpkgs-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/archlinuxpkgs.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

