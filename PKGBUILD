# Maintainer: Popolon <popolon@popolon.org>

pkgname=cpu_rec-git
_pkgname=cpu_rec
pkgver=v1.0.r30.g108f40a
pkgrel=1
pkgdesc="tool that recognizes cpu instructions in an arbitrary binary file. It can be used as a standalone tool, or as a plugin for binwalk"
arch=('any')
url='https://github.com/airbus-seclab/cpu_rec'
license=('Apache 2.0')
depends=('xz' 'python')
conflicts=('cpu_rec')
source=("${pkgname}::git+https://github.com/airbus-seclab/cpu_rec"
        'cpu_rec')
sha512sums=(SKIP
            '73f872caca6dabbcfeddb3f533859f7b7c86d4031760b5baedda8829fe2f94197d87820af1e8e3a560ae11e01a9ae30357b10f9bc57b462b83dc80043ae3d364')
b2sums=(SKIP
        'a06474bfbc9868138fa96ef5730999f11fb523c32c7cf8a60cc0485192b13756c2bb55d9a4be37abcf8aee969b589a9f59b7eadc9b8b4f86a7aa733cd90c11b9')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tag | sed -r "s/${_pkgname}-//; s/([^-]*-g)/r\1/; s/-/./g"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/cpu_rec"
    cd "${pkgname}"
    install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/" "cpu_rec.py"
    for file in cpu_rec_corpus/*.xz
    do
      install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/cpu_rec_corpus/" "${file}"
    done
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENCE
}
