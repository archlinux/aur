# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=rustdesk-server-bin
_pkgname=rustdesk-server
pkgver=1.1.5
pkgrel=2
pkgdesc="RustDesk Server Program"
arch=('x86_64' 'aarch64')
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
source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::https://github.com/rustdesk/rustdesk-server/releases/download/${pkgver}/rustdesk-server-linux-arm64v8.zip")

sha256sums=('6d6e175e615aa1fc9be53947191934f80314d8e975f3b94a2f2d75580a70eb88'
            '316690b5e5d17130436e27848fe19ee168aeecbc6f2c0607981ca5afa49fc20d'
            '09d880c1c7987e9e7262c9f2fb56120d14b708238f3c7f14c800e6234b798440')
sha256sums_x86_64=('02f52cf2c3a06a7ede1faff801abc849363fe5a19160388c10630a0457a6b1a3')
sha256sums_aarch64=('c6517137fe7938ae73f2a3ad17c2f19853b421e00962ea3943b35071013e7e71')
install=${_pkgname}.install



package() {
     cd $srcdir
     install -Dm755 hbbr -t ${pkgdir}/opt/${_pkgname}
     install -Dm755 hbbs -t ${pkgdir}/opt/${_pkgname}
     cp -rf static ${pkgdir}/opt/${_pkgname}
     mkdir ${pkgdir}/opt/${_pkgname}/data
     
     install -Dm644 *.service -t ${pkgdir}/usr/lib/systemd/system
     
     install -Dm644 $srcdir/rustdesk-server.sysusers  \
          ${pkgdir}/usr/lib/sysusers.d/rustdesk-server.conf
#      install -Dm644 "$srcdir"/${_pkgname}.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/${_pkgname}.conf
}
