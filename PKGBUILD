# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.0
_pkgver=${pkgver}
pkgrel=2
pkgdesc="Another file list program that supports multiple storage"
arch=('x86_64')
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
source=("$_pkgname-$pkgver.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz")
sha256sums=('c52d35bd04ae6a99763979f290e2124e448809701530a53450d2e48f3e98d21b')

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
