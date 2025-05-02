# Maintainer: MartorSkull <livemartor@gmail.com>
_pkggen=komodo
_pkgcat=periphery
_pkgname=${_pkggen}-${_pkgcat}
pkgname=${_pkgname}-bin
pkgver=1.17.4
pkgrel=1
epoch=0
pkgdesc='Periphery server for the komodo monitor'
arch=('x86_64')
url='https://komo.do/'
license=('GPL')
depends=('docker' 'openssl')
makedepends=('cargo' 'git')
source=(
    "$_pkgcat::https://github.com/moghtech/komodo/releases/download/v${pkgver}/periphery-x86_64"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('0237fa1e8077613feeb3d399b969b62c248e1cacab686377ee963c408b392b72'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '3ce390159db98a55ca519eb62f2d89ceb7050e9256c931f38b457f1c4a43f651'
            'f4b549451a3d22de81dd8ed933c290777581ef92f2276160e91092739c867aee'
            'ac8939c55deb01929c36377f17f49cfbde5dfa7ef2a16d827078b19a72cde027')

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
