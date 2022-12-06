# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.6.0
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "x86_64")
url="https://github.com/alist-org/alist"
license=('AGPL3')
provides=(${_pkgname})
backup=("etc/alist/config.json")
source=("alist.service" "config.json")
optdepends=('aria2: download by aria2.')
install=alist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/alist-linux-amd64.tar.gz")
sha256sums=('8b38a0800197e1f1508ebc3357389b1f48f596093091c8aada4e9a05b7e74a3f'
            'b72f194a7b8855e97eeb76e63e179f38132cc9e6be9daa5b396699c9c11611de')
sha256sums_aarch64=('02388372839c3b6c2e05d0648e74468a25c998ba5aff621842691a5eaf6d8ff6')
sha256sums_x86_64=('6ea286331f361c3b1b366c199dd2741800577d6792760e9057af3406c24db93d')

package() {
    install -Dm755 alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
    install -d ${pkgdir}/var/lib/alist
    ln -s /etc/alist/config.json ${pkgdir}/var/lib/alist/config.json
}
