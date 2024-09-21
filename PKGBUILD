# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer: Marat Bakeev <hawara@gmail.com>
# Ex-Maintainer: Dennis Oehme <oehme@gardenofconcepts.com>

pkgname=kops-bin
pkgver=v1.30.1
_build=${pkgver}
pkgrel=1
pkgdesc='Kubernetes Operations (kOps) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=(x86_64 aarch64)
license=('apache')
conflicts=('kops' 'kops-beta-bin' 'kops-git' 'kops21-bin')

source_x86_64=("$pkgname-$pkgver::https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
source_aarch64=("$pkgname-$pkgver::https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-arm64")
sha256sums_aarch64=('ce977c5c46df214abee8ed7ceea1cda010584bdb98585b099bdcb15e3e5fcbfe')
sha256sums_x86_64=('aa797aa86803d6e609fda3d99fcecb50ff3f94207335d7aa1e96713b4e1a4df6')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/$pkgname-$pkgver ${pkgdir}/usr/bin/kops

    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"

    "$pkgdir/usr/bin/kops" completion bash > "$pkgdir/usr/share/bash-completion/completions/kops"
    "$pkgdir/usr/bin/kops" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_kops"
}
