# Maintainer: Marat Bakeev <hawara@gmail.com>
# Ex-Maintainer: Dennis Oehme <oehme@gardenofconcepts.com>

pkgname=kops-bin
pkgver=v1.21.1
_build=${pkgver}
pkgrel=1
pkgdesc='Kubernetes Operations (kOps) - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=('x86_64')
license=('apache')
conflicts=()

source_x86_64=("$pkgname-$pkgver::https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
sha256sums_x86_64=('9c73657d75399d74220e0d55f226121b15b568c265f2398891a27e63889eaa4f')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/$pkgname-$pkgver ${pkgdir}/usr/bin/kops

    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"

    "$pkgdir/usr/bin/kops" completion bash > "$pkgdir/usr/share/bash-completion/completions/kops"
    "$pkgdir/usr/bin/kops" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_kops"
}
