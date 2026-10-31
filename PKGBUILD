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
b2sums=('39c6266b6449e4c065b472db8e284f3f7e936f076bfd16ced1c122c4dddbd5bebc193398f20ba7f069cfa884cd9fe6abe4b43d632c0ff4e6c3c42a276c514ad9'
        'c2f4cbb7b1e65ec0057aa024da71e2002007593e132bde49e42c8650bb69cd98afc3a061f9fd6ff4caa574769fde9fbab5e663a207830b24b24fba69c9a2ee32'
        '14a2675bf1c83aa2463cf735907816a7683c82cf678fa1c709e0abbbfd9767e15fea7c8281e45f7d6698b9f02eaf51f6c9ebe3ff8502b084ecbb95267c4e4084'
        'e42d881cd563fa0630bf108d15ec3bbedb98a710a6713db0e85d7fd0140f7a342c6918896a0c396e0f24e4b90724e9b6e891c453422245edd558a65777871a8d'
        '16840a718a77e8956813ddfb4c6a284a2d565c357df8961287615964f5cf1a94eafd627fde1bbbec2c6df081a27a4e0a28951a23668fcec056830ebbaae7d233')
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
