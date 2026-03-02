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
sha256sums=('bbe1f2309460375355b43d720b5043590a481c5fef64ba1b51cdb45e8ea9f81f'
            '64884d0e219ec69eb586cb6bfd112ae61ca7cc9d7cee22033cb6ad294d6b3846'
            'f65f1bc2ff9e33e36a0f2ed98bc21dd1cd262d07a4588889e875a75e96dab2ee'
            'fc914b73edfda6bb54c3564ea46ee0ba9fe918bc05f066661b829d6c6406a681'
            '7ca37c452a577032b867daff95963d8d781a66adffa19a899b0380687c21e254')
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
