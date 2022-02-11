# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.9
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=('x86_64')
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
source=("${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz")
sha256sums=('2ca2279d73406b71e30323d341e96687c7d7c7c0b160e6ca9b5847820cfc17f8')

prepare() {
    echo """[Unit]
Description=alist
After=network.target

[Service]
Type=simple
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/alist -conf data/config.json
Restart=on-failure

[Install]
WantedBy=multi-user.target
""" >alist.service
}

package() {
    install -Dm755 alist-linux-amd64 ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
}
