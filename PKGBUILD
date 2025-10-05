# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer: Marat Bakeev <hawara@gmail.com>
# Ex-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=v1.34.0_beta.1
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Prerelease builds - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=(x86_64 aarch64)
license=('apache')
conflicts=('kops-bin' 'kops')

source_x86_64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
source_aarch64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-arm64")
sha256sums_x86_64=('9d57a35d61e91e46cc2555892814f4b125dd43e438028d7d319be522f4bb3bcb')
sha256sums_aarch64=('f8ebe977ef0853a54cd8345d615fcb7ec98948ede1dd138ea95fa22671815ae8')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops

    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"

    "$pkgdir/usr/bin/kops" completion bash > "$pkgdir/usr/share/bash-completion/completions/kops"
    "$pkgdir/usr/bin/kops" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_kops"
}

