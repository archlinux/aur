# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=rustdesk-server-bin
_pkgname=rustdesk-server
pkgver=1.1.5
pkgrel=1
pkgdesc="RustDesk Server Program"
arch=('x86_64' 'aarch64')
url="https://github.com/rustdesk/rustdesk-server"
license=('Proprietary')
provides=(${_pkgname})
source=("rustdesk-server.sysusers"
"rustdesk-server-hbbs.service"
"rustdesk-server-hbbr.service"
)
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/rustdesk/rustdesk-server/releases/download/${pkgver}/rustdesk-server-linux-x64.zip")
source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::https://github.com/rustdesk/rustdesk-server/releases/download/${pkgver}/rustdesk-server-linux-arm64v8.zip")

sha256sums=('8e462241d7da6891d80b2ca48d63354ccccb79a210db4b7af5a8837dbd629bd2'
            '6e366c0c3c73a4e8dd6a03b9ad8dbf984e055dc426f17c6f5850f75c15d92048'
            '45d42ed911e143e8f987cf9bf859e2d398d447879e3320465f6c964906863f08')
sha256sums_x86_64=('02f52cf2c3a06a7ede1faff801abc849363fe5a19160388c10630a0457a6b1a3')
sha256sums_aarch64=('c6517137fe7938ae73f2a3ad17c2f19853b421e00962ea3943b35071013e7e71')
install=${_pkgname}.install



package() {
     cd $srcdir
     install -Dm755 hbbr -t ${pkgdir}/opt/${_pkgname}
     install -Dm755 hbbs -t ${pkgdir}/opt/${_pkgname}
     cp -rf static ${pkgdir}/opt/${_pkgname}
     
     install -Dm644 *.service -t ${pkgdir}/usr/lib/systemd/system
     
     install -Dm644 $srcdir/rustdesk-server.sysusers -t ${pkgdir}/usr/lib/sysusers.d/
}
