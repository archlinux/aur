# Maintainer: MartorSkull <livemartor@gmail.com>
_pkggen=komodo
_pkgcat=periphery
_pkgname=${_pkggen}-${_pkgcat}
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
epoch=0
pkgdesc='Periphery server for the komodo monitor'
arch=("$CARCH")
url='https://komo.do/'
license=('GPL-3.0-only')
depends=('docker' 'openssl' 'glibc' 'libgcc')
makedepends=('git')
provides=('komodo-periphery')
conflicts=('komodo-periphery')
backup=("etc/${_pkgname}.toml")
options=('!debug')
source=(
    "$_pkgcat::https://github.com/moghtech/komodo/releases/download/v${pkgver}/periphery-$CARCH"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('15f6834b2dbac0314807723a30292ef942841b310ba81f133fd80b2ca5e96fa7'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '08aa0be0c76bcfb0ea6e73a08db5d619eb7f3dd76fa1ff74888ed9a13eb36d4d'
            '11ad45b19ebce10027eefc16e04362cefda528048f05b43f2d499ebbfec7da84'
            'a6d0a79175dd67d193e999a391d99c1ed0785e67773f3fd24d07deead4060c31')

_server_root="/srv/${_pkgname}"

package() {
    cd "$srcdir/"
    install -Dm755 ${_pkgcat} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${_pkgname}d.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}d.service"
    install -Dm644 ${_pkgname}d.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}d.conf"
    install -Dm644 ${_pkgname}d.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}d.conf"
    install -Dm644 ${_pkgcat}.config.toml "${pkgdir}/etc/${_pkgname}.toml"
}
