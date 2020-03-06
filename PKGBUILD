# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.8
pkgrel=1
arch=(x86_64 i686 aarch64 arm6h arm7h)
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
source_aarch64=(${_source}-arm64.tar.gz)
source_arm6h=(${_source}-armv6.tar.gz)
source_arm7h=(${_source}-armv7.tar.gz)
sha512sums_x86_64=('0ad511f8e7990e7fb78b204b7280d65330140140df1ca855b2ffc8f65eb8962e0a6b85be216c1bf921b660666d374ebc1cfc7d07f2f7694e9d2342efe4681a65')
sha512sums_i686=('e23f821677e0973d0c6402692166e8d8d1df04da7e1ec85c460293690e9630150ce83fc2d06cccb4c341e087554403bd621c5e4a897c794f1954dc128f63d68e')
sha512sums_aarch64=('a3397e173d3ba1e3a9fe1f94fa4409f3d043c95d7b7a98a2e64082156c3b962024808ae90dc4264d99e2465dd8f3fd4b9e0f16ba7ab564dd499bb7d0890110b2')
sha512sums_arm6h=('cd6efd9b233b8e8c50f521bf6120541370431a472661f019301f26b23748a169056326c4a7f7fb8454ceab01c0da086a4dc5eae981805b8b9a137b058886f229')
sha512sums_arm7h=('a3fdf16eaad67d880157ca6ad5a8c2b3fa935392534f08ffc1fbe9712d566f0b2464216008a3af370d766333d102015b3116070a06d610b6529d944f1628a3f2')


case $CARCH in
    i686) _suffix=386 ;;
    x86_64) _suffix=amd64 ;;
    aarch64) _suffix=arm64 ;;
    arm6h) _suffix=armv6 ;;
    arm7h) _suffix=armv7 ;;
esac

package() {
    install -dm755 "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
    install -Dm755 "${_pkgname}-${pkgver}-linux-${_suffix}/golangci-lint" "$pkgdir"/usr/bin/golangci-lint
    "$pkgdir"/usr/bin/golangci-lint completion bash > "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
    "$pkgdir"/usr/bin/golangci-lint completion zsh > "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
