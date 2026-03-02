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
sha256sums=('5658b713add980d64e9caa95a7b3b7c5c2caedd5e54d38cae1cc98ed3db9a2ab'
            'bafa36688616d176b4a00006a922780f246fbdd8da330c9394f026ab5c78604e'
            '5676b6d48d04bef5971070dfeb74c966c3ea79521b3fb19e522e781c7e8cc1cd'
            'e349123a95f975bf8861e28effcc8325c15cdece9c8b3aebdc8df26f05678cb0'
            '5af791ae656c94244d4df467a08a068b0e9a68f0cb67aa9d9faee5816ef7fe1c')
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
