# Maintainer Chris Werner Rau <aur@cwrau.io>
# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

_name=telepresence
pkgname=${_name}2
pkgver=2.23.6 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=(any)
makedepends=('go' 'git' 'make' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1748cf22a0d4163962c449499e786061')

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
