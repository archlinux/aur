# Maintainer: MartorSkull <livemartor@gmail.com>
_pkggen=komodo
_pkgcat=periphery
_pkgname=${_pkggen}-${_pkgcat}
pkgname=${_pkgname}-bin
pkgver=1.19.5
pkgrel=0
epoch=0
pkgdesc='Periphery server for the komodo monitor'
arch=('x86_64')
url='https://komo.do/'
license=('GPL')
depends=('docker' 'openssl')
makedepends=('git')
provides=('komodo-periphery')
conflicts=('komodo-periphery')
backup=('etc/komodo-periphery.toml')
source=(
    "$_pkgcat::https://github.com/moghtech/komodo/releases/download/v${pkgver}/periphery-x86_64"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('d6e89cb3602f7df7b64c43d35892c641578119c245196baed2857d7d07859470'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '08aa0be0c76bcfb0ea6e73a08db5d619eb7f3dd76fa1ff74888ed9a13eb36d4d'
            'f4b549451a3d22de81dd8ed933c290777581ef92f2276160e91092739c867aee'
            'baae0d9e1c5d1cbf6594ff538c1a2daaacd6a1da7eca0f7996102a3c0e1ef11e')

_server_root="/srv/${_pkgname}"

package() {
    cd "$srcdir/"
    install -Dm755 ${_pkgcat} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${_pkgname}d.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}d.service"
    install -Dm644 ${_pkgname}d.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}d.conf"
    install -Dm644 ${_pkgname}d.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}d.conf"
    install -Dm644 ${_pkgcat}.config.toml "${pkgdir}/etc/${_pkgname}.toml"

    mkdir -p "${pkgdir}${_server_root}/ssl"
    chmod g+ws "${pkgdir}${_server_root}"
}
