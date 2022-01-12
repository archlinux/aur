# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.5
_pkgver=${pkgver}-libc
pkgrel=2
pkgdesc="Another file list program that supports multiple storage"
arch=('x86_64')
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
source=("${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz")
sha256sums=('7ccb47ae3e69395e0127d0cc3d3bee68e57859dee9e0bb23d267e008ba488c7b')

prepare() {
    cd $srcdir
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
