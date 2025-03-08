# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer: Marat Bakeev <hawara@gmail.com>
# Ex-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mickybart <mickybart@pygoscelis.org>

pkgname=kops-beta-bin
pkgver=v1.32.0_beta.1
_build=${pkgver//_/-}
pkgrel=1
pkgdesc='Kubernetes Operations Prerelease builds - Production Grade K8s Installation, Upgrades, and Management'
url='https://github.com/kubernetes/kops'
arch=(x86_64 aarch64)
license=('apache')
conflicts=('kops-bin' 'kops')

source_x86_64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-amd64")
source_aarch64=("https://github.com/kubernetes/kops/releases/download/${_build}/kops-linux-arm64")
sha256sums_x86_64=('ff5a222b49b315ba4e108afba8d17a7e19392ba12d01f858b1d089d210913291')
sha256sums_aarch64=('316de88457914bdbda3deed8b68cb80f60924560d9d459c9e08e6e8ad9b5b8e5')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/kops-linux-amd64 ${pkgdir}/usr/bin/kops

    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"

    "$pkgdir/usr/bin/kops" completion bash > "$pkgdir/usr/share/bash-completion/completions/kops"
    "$pkgdir/usr/bin/kops" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_kops"
}

