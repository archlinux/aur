# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=archium
pkgname=${_pkgname}-bin
pkgdesc="Fast & Easy Package Management for Arch Linux"
pkgver=1.10.4
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64')
license=('BSD-3-Clause')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'readline')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
    "README-${pkgver}.md::${_urlraw}/README.md"
    "COMPLETIONS-${pkgver}.bash::${_urlraw}/completions/archium.bash"
    "COMPLETIONS-${pkgver}.zsh::${_urlraw}/completions/archium.zsh"
    "COMPLETIONS-${pkgver}.fish::${_urlraw}/completions/archium.fish")
source_x86_64=("${pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('902a7e75cd9fe153f43dce5f5fe85b8bbae0c28eb3fb87c299243e2c4c5d9c9e14caf42c90f7070bd67930d99f6d010f9553d8365ccf27b4ae429e5daabc5e2b'
        '6022493d916573e66852f28c035ffa1d562a542a5190bc1d57de07fc5fc085141b9e1a69cc78d5905421b6851e48946d567b502d320e2d29583f51b79d3bd820'
        '252d40508d9cc044a7f7cab729334dadeca4e65f36c240bd5102d0ddead07c24f7bae5b7e4d43c9da5b42582d28b3ca9e138405f9870c607bd25bccb9d59cade'
        '3e4074bd6081ead0a0ea2413fb8347090a82ab7089da0869793a9c8844f6e291b69a357121a3a3d26854bd429931c7839bf137645c5b53da47ec917e12287281'
        '6ccb3a5ee122d6d566d659cecef3e99810466e71259c145cde231a44af168ce30897d990652227ddd748d8f06889ea41147c01ed6b7f832e5d57f6080327346f')
b2sums_x86_64=('de6fd24c0e26143fb482c5a640901c04faa4ac2e38ee74e6220691d11fff98ae0e037c9aaff9a7fa7c9f9bef5ba8ef96651d66655f7035cfbd6300effc174b02')

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
