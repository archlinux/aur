# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=3.3.12
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'bash' 'bzip2' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'libcups' 'libdrm'
         'libffi' 'libx11' 'libxcb' 'libxkbcommon' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
         'mesa' 'nspr' 'nss' 'openssl' 'pango' 'readline' 'util-linux-libs' 'xorg-server-xvfb' 'xz' 'zlib')
conflicts=('flaresolverr' 'flaresolverr-git')
options=('!strip')
install='flaresolverr.install'
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/${__pkgname}/${__pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_x64.tar.gz"
        "https://raw.githubusercontent.com/${__pkgname}/${__pkgname}/v${pkgver}/LICENSE"
        "flaresolverr.service"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles"
        "flaresolverr.install")
sha512sums=('60fb582899fb9c36a3ea272113c97a7527d5524bb13ab63f4eb8b1b99d123eed65058da32fbabccabc01e190e9fe6c9473c096ad6841d5e178901ee2a6bf8b0a'
            'ea3aa3af56f503faa7cae884748386ddd87aa7887d1dd3ec010270510c6b477a2627efde3ebddaf60f414d0a5eb34964464c212219cd5423efd0303a7055fc54'
            '7e3c7292c16103be75e5f6caaea1b70e9b1be72d54a7594e666cb95061d23c72aa93aa8510891f4821c19979d0199852f4f587ec392aa12e92bfffb06a1a6bf8'
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d'
            'f27805d81e19547862f5e8ebf18633dd400543ebd85566301386dc143ad2de1920dd6c37d1ae38623221dcb42edecdd6b753ccfd20ad33e92a4633cfb7a50548'
            'e12ca34e2f66524d15da36cdebea300ae061a16c8a4d7147ab0cea11cb70879d0d3061c9c852dec9593f348bc8507055f1868cfe754e2e5f92db4466ca3ec2a1')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/opt/flaresolverr"
    cp -a "${_pkgname}" "${pkgdir}/opt"
    rm "${pkgdir}/opt/flaresolverr/libreadline.so.8"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    install -Dm644 "flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
