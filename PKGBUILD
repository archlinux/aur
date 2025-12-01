# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer: Marat Bakeev <hawara@gmail.com>
# Ex-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=v1.35.0_alpha.1
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Prerelease builds - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=(x86_64 aarch64)
license=('apache')
conflicts=('kops-bin' 'kops')

source_x86_64=("$pkgname-$pkgver::https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
source_aarch64=("$pkgname-$pkgver::https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-arm64")
sha256sums_x86_64=('abc421ebf4c5013bda2a057fb9f48c6cb7d374715ee3c128f008bd14d705f88d')
sha256sums_aarch64=('40b7c33631793d6e419e78f7003cef50a0fb3e940c81f9c287225c34bee76ed4')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/$pkgname-$pkgver ${pkgdir}/usr/bin/kops

    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"

    "$pkgdir/usr/bin/kops" completion bash > "$pkgdir/usr/share/bash-completion/completions/kops"
    "$pkgdir/usr/bin/kops" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_kops"
}

