# Contributor: WangGithubUser
# Maintainer: wyf9661 <wyf9661@hotmail.com>

pkgname='fastgithub'
pkgver=2.1.5
pkgrel=2
pkgdesc="Speedup github access in China"
arch=('x86_64' 'aarch64')
url="https://github.com/WangGithubUser/FastGitHub"
license=('MIT')
depends=('systemd')
options=('!strip')
source=("${pkgname}.service")
source_x86_64=(${pkgname}-x86_64.zip::"${url}/releases/download/v${pkgver}/${pkgname}_linux-x64.zip")
source_aarch64=(${pkgname}-aarch64.zip::"${url}/releases/download/v${pkgver}/${pkgname}_linux-arm64.zip")
sha256sums=('250bc9ffb01adbc12eb4f8a23ffcd05ba39e843a804eb516cf8b781fdc8a6aff')
sha256sums_x86_64=('f4e9caa10bf31f9245610bf5770b26ec8c13eb11337d11bc66bbabc5ddefabf2')
sha256sums_aarch64=('f17ffdb8ac34c64cc31a82b5a93ee904c49ba8629e9e968022b5ea4a019754db')

package() {

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a ${srcdir}/${pkgname}_linux*/* "${pkgdir}/opt/${pkgname}"

    cd ${srcdir}/${pkgname}_linux*
    install -Dm755 "${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm755 "dnscrypt-proxy/dnscrypt-proxy" "${pkgdir}/opt/${pkgname}/dnscrypt-proxy/dnscrypt-proxy"
    install -Dm644 "dnscrypt-proxy/dnscrypt-proxy.toml" "${pkgdir}/opt/${pkgname}/dnscrypt-proxy/dnscrypt-proxy.toml"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 ${srcdir}/${pkgname}.service  ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
