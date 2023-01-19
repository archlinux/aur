# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=3.9.1
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
sha256sums_aarch64=('9455b454f8e8182c1f262a5eb5386bce05a2cb6862e57d8ed690cde42b93d549')
sha256sums_x86_64=('d12981bd1f98d78f8fa549257f0d8fd9aaed22bc8cbe2003d05de96de6896fac')

package() {
    install -Dm755 alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/alist
    install -d ${pkgdir}/var/lib/alist
    ln -s /etc/alist/config.json ${pkgdir}/var/lib/alist/config.json
}
