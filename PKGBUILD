# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

pkgname=telepresence2
pkgver=2.21.3 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=2
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64')
license=('Apache')
url="https://github.com/telepresenceio/telepresence"
makedepends=('go' 'git' 'make' 'jq')
backup=()
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('ce808d9eca309530f77e42b15afb7c9a')

package() {
  cd "${srcdir}/telepresence-${pkgver}"
  TELEPRESENCE_VERSION=v${pkgver} make build
  install -Dm755 ./build-output/bin/telepresence "${pkgdir}/usr/bin/telepresence"
  "${pkgdir}/usr/bin/telepresence" completion zsh >"$srcdir/zsh_telepresence"
  "${pkgdir}/usr/bin/telepresence" completion fish >"${srcdir}/fish_telepresence"
  "${pkgdir}/usr/bin/telepresence" completion bash >"$srcdir/bash_telepresence"
  install -D -m 0644 "$srcdir/zsh_telepresence" "$pkgdir/usr/share/zsh/site-functions/_telepresence"
  install -D -m 0644 "${srcdir}/fish_telepresence" "${pkgdir}/usr/share/fish/completions/telepresence.fish"
  install -D -m 0644 "$srcdir/bash_telepresence" "$pkgdir/usr/share/bash-completion/completions/telepresence"
}
