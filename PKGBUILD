# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.16.5
pkgrel=3
pkgdesc="The Kubernetes Package Manager"
arch=(
  "x86_64"  # amd64
  "aarch64"  # arm64
  "arm" "armv6h" "armv7h"  # arm
  "i486" "i686"  # i386
)
url="https://helm.sh/"
license=("Apache")
provides=("helm")
makedepends=("grep")
validpgpkeys=(
  '672C657BE06B4B30969C4A57461449C25E36B98E'  # Matthew Farina <matt@mattfarina.com>, https://keybase.io/mattfarina
)

[ "${CARCH}" = "x86_64" ] && _CARCH=amd64 && sha256sums=(
  '7cd54f56f787d62fd7311d5ae2c26e31310d37d27e3622014e5c769bec008cab'
  'SKIP'
)

[ "${CARCH}" = "aarch64" ] && _CARCH=arm64 && sha256sums=(
  'ace7eef2a446886600e5ff7efec4a03bab85de0bef29c6af2fb4bfd96d54c31e'
  'SKIP'
)

echo ${CARCH} | grep -E '^arm' &>/dev/null && _CARCH=arm && sha256sums=(
  'f35b694ba14555ea4124c558967e3947859282ec8d9c3a883c96bd1ae0ddc2b5'
  'SKIP'
)

[ "${CARCH}" = "i486" -o "${CARCH}" = "i686" ] && _CARCH=386 && sha256sums=(
  'ace7eef2a446886600e5ff7efec4a03bab85de0bef29c6af2fb4bfd96d54c31e'
  'SKIP'
)

source=(
  "https://get.helm.sh/helm-v${pkgver}-linux-${_CARCH}.tar.gz"
  "https://github.com/helm/helm/releases/download/v${pkgver}/helm-v${pkgver}-linux-${_CARCH}.tar.gz.asc"
)

package(){
    cd "linux-${_CARCH}"
    install -Dm755 -t "$pkgdir/usr/bin" helm tiller
    ./helm completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/helm"
    ./helm completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_helm"
}
