# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.7.1
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
sha256sums_aarch64=('4a7bc06b23e36961e692bcfff4a661fdb5d5d9b3c2b7b00621196ff80a10ef81')
sha256sums_x86_64=('9faaab587edeb08bcb950021af43aaee421de02959da7818abece3861300cc45')

package() {
    install -Dm755 alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
    install -d ${pkgdir}/var/lib/alist
    ln -s /etc/alist/config.json ${pkgdir}/var/lib/alist/config.json
}
