# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.6
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
sha512sums_x86_64=('34c3f60bccac0c63412606ed73e702aec95f2d53df3f7e8e7c0e003370f00ec2ab6d4d214ef7270a07515a65e5357912d06c4f858d7f11205c8dcef509ad9023')
sha512sums_i686=('af36da2dc9adbec4a4b0401129793ec6e6c74b7c0c3dfd1ca21b741e1b8e92e5a1a23488a38f226925c51c1bf2306453e6ee3e347c4dc8a8fd9c517ec45cd07f')
sha512sums_aarch64=('b5777fcf22f9854c5fa06a848a6733d9072db78cbc2ad7ad442a8dc4f12a50223cc2e5ba31788a1ef8e94e8425b842c6c4a9d389177f5ebb6b88da64b336ab5c')
sha512sums_arm6h=('5e7caaca80ef248706fe3b8a6b3c61fa5ebc84a8f18d5cbe9fd8b8e99e7485c6731bc0a09c62463ae994be5443a06719fded3bf322bd12fc9d637cb8fe0299da')
sha512sums_arm7h=('493e1cf9ef6fa480a7d806fff3873f00e1e47a3694c25678377957c1b605217e2e1b95780e150ed5bc89716b07f36769628799779cc3c052705e6413f07545eb')


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
