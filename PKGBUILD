# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer: Marat Bakeev <hawara@gmail.com>
# Ex-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=v1.34.0_alpha.1
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Prerelease builds - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=(x86_64 aarch64)
license=('apache')
conflicts=('kops-bin' 'kops')

source_x86_64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
source_aarch64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-arm64")
sha256sums_x86_64=('9ac3d78bb3d60591da6febbe5b207c7c588ee6728cd3bce3ff94a23e66c786a6')
sha256sums_aarch64=('c1b63c3e3a8290f2749768fe6bcfc7ddf43c329936b52135e4015cd977497bf3')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops

    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"

    "$pkgdir/usr/bin/kops" completion bash > "$pkgdir/usr/share/bash-completion/completions/kops"
    "$pkgdir/usr/bin/kops" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_kops"
}

