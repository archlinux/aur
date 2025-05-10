# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>

pkgname=lip-bin
_pkgname=lip
pkgver=0.31.0
pkgrel=1
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=(lip-git)
options=(!strip)

source_x86_64=(
    "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-cli-linux-x64-self-contained.tar.gz"
    "lip.1"
)
source_aarch64=(
    "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-cli-linux-arm64-self-contained.tar.gz"
    "lip.1"
)

md5sums_x86_64=(
    "f797fff2b6c10e075353c3a93fc2344d"
    "16ded768675b51f0e49d76ac17c9fae5"
)
md5sums_aarch64=(
    "57a935f54d8b886d0a75572912a59fe3"
    "16ded768675b51f0e49d76ac17c9fae5"
)

prepare() {
    rm -rf "${srcdir}/${pkgname}"
    mkdir -p "${srcdir}/${pkgname}"
    tar -zxf "${pkgname}-${arch}.tar.gz" -C "${srcdir}/Lip"
    chmod +x "${srcdir}/${pkgname}/lip"
}

package() {
    install -dm755 "${pkgdir}/opt/${_pkgname}"

    cp -a "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${_pkgname}/"

    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/lip"

    install -Dm 644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/lip" "${pkgdir}/usr/bin/${pkgname}"
}
