# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=archium
pkgname=${_pkgname}-bin
pkgver=1.10.4
pkgrel=1
pkgdesc="Archium is a wrapper for AUR helpers such as YAY and Paru"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://github.com/${_pkgauthor}/${_pkgname}/blob/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'readline')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
    "README-${pkgver}::${_urlraw}/README.md"
    "COMPLETIONS-${pkgver}.bash::${_urlraw}/completions/archium.bash"
    "COMPLETIONS-${pkgver}.zsh::${_urlraw}/completions/archium.zsh"
    "COMPLETIONS-${pkgver}.fish::${_urlraw}/completions/archium.fish")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b86d94d6054949ade5efc5fc6cd86c3a4c9d5bbc252d421ba724a57f4e96a20a'
            '4b87656e01414e74b0b965ea13434af2e21807a1420743ae43186fd691e3c2c3'
            '466903e5b1ec1dbb4756213cc2a2def559b4276a9bcb1b8f72ec12dc48771919'
            'e69053cfab4f89f5faf0e649689eb7f581a63ad341a4ce505a30a147c21a127d'
            '3562affe093e8dda253e9a35988bddc03cfc1707b536d3a8818c5eee59be6404')
sha256sums_x86_64=('253dcecfd6e0a234c0586c24b178f49b9a2077d117ba4fac7ba46f44f0f4576f')

prepare() {
    cd "${srcdir}/" || exit

    mv "release/${_pkgname}" ./
    rm -rf "release"

    mkdir -p "completions"
    for completion in COMPLETIONS*; do
        mv "${completion}" "./completions"
    done
}

package() {
    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "completions/COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/archium"
    install -Dm644 "completions/COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_archium"
    install -Dm644 "completions/COMPLETIONS-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/archium.fish"

    install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
