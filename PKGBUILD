# Contributor: WangGithubUser
# Maintainer: FTS427 <FTS427@outlook.com>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m> 
pkgname='fastgithub-bin'
_pkgname='fastgithub'
pkgver=2.1.5
pkgrel=4
pkgdesc="Speedup github access in China"
arch=('x86_64' 'aarch64')
url="https://github.com/WangGithubUser/FastGitHub"
_url="https://slink.ltd/${url}"
license=('MIT')
depends=('zlib' 'glibc' 'gcc-libs')
makedepends=('unzip')
options=('!strip')
provides=('fastgithub')
install="${pkgname}.install"
source_x86_64=(${_pkgname}-${arch}.zip::"${_url}/releases/download/v${pkgver}/${_pkgname}_linux-x64.zip")
source_aarch64=(${_pkgname}-${arch}.zip::"${_url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64.zip")
sha256sums_x86_64=('f4e9caa10bf31f9245610bf5770b26ec8c13eb11337d11bc66bbabc5ddefabf2')
sha256sums_aarch64=('f17ffdb8ac34c64cc31a82b5a93ee904c49ba8629e9e968022b5ea4a019754db')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    
    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
    
    if [ ${arch} == x86_64 ]; then
        install -Dm 755 "${srcdir}/${_pkgname}_linux-x64/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
        install -Dm 755 "${srcdir}/${_pkgname}_linux-x64/dnscrypt-proxy/dnscrypt-proxy" "${pkgdir}/opt/${_pkgname}/dnscrypt-proxy/dnscrypt-proxy"
        install -Dm 644 "${srcdir}/${_pkgname}_linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    else
        install -Dm 755 "${srcdir}/${_pkgname}_linux-arm64/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
        install -Dm 755 "${srcdir}/${_pkgname}_linux-arm64/dnscrypt-proxy/dnscrypt-proxy" "${pkgdir}/opt/${_pkgname}/dnscrypt-proxy/dnscrypt-proxy"
        install -Dm 644 "${srcdir}/${_pkgname}_linux-arm64/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    fi

    ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
