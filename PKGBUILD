# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=rustdesk-server-bin
_pkgname=rustdesk-server
pkgver=1.1.6
pkgrel=2
pkgdesc="RustDesk Server Program"
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk-server"
license=('AGPL3')
provides=(${_pkgname})
conflicts=("rustdesk-server-demo")
source=(
"${_pkgname}-hbbs.service"
"${_pkgname}-hbbr.service"
"${_pkgname}.sysusers"
)
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/rustdesk/rustdesk-server/releases/download/${pkgver}/rustdesk-server-linux-x64.zip")
# source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::https://github.com/rustdesk/rustdesk-server/releases/download/${pkgver}/rustdesk-server-linux-arm64v8.zip")

sha256sums=('ab4826703bfa96f5371f02fcb4575fff435554d575213cedca8cb1f39564601e'
            'bf6bdb07ae69d6cfde433781f23376036cb9ad2f1bc1fc7ee44bd56de38ad11d'
            '09d880c1c7987e9e7262c9f2fb56120d14b708238f3c7f14c800e6234b798440')
sha256sums_x86_64=('0508887eeaa2c1085b1b062667a77944e8ed070b9d4a9f65f61a62cfa2b80d62')
# sha256sums_aarch64=('c6517137fe7938ae73f2a3ad17c2f19853b421e00962ea3943b35071013e7e71')
install=${_pkgname}.install



package() {
     cd $srcdir
     install -Dm755 hbbr -t ${pkgdir}/opt/${_pkgname}
     install -Dm755 hbbs -t ${pkgdir}/opt/${_pkgname}
     mkdir ${pkgdir}/opt/${_pkgname}/data

     install -Dm644 *.service -t ${pkgdir}/usr/lib/systemd/system

     install -Dm644 $srcdir/rustdesk-server.sysusers  \
          ${pkgdir}/usr/lib/sysusers.d/rustdesk-server.conf
}
