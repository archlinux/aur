# Maintainer: Askexz <xmingwp@gmail.com>
pkgname=six-cli-git
pkgver=V0.0.6.alpha.r0.g0eba4dc
pkgrel=1
pkgdesc="6盘(https://6pan.cn/)命令行工具."
arch=('x86_64')
depends=()
makedepends=('git' 'go-pie')
conflicts=("six-cli")
provides=("six-cli")
url="https://github.com/Mrs4s/six-cli"
license=("MIT")

source=("${pkgname}::git+https://github.com/Mrs4s/six-cli")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    go build -x -v -ldflags "-extldflags 'static' -s -w"
}

package() {
    cd "${pkgname}"
    install -Dm755 six-cli "${pkgdir}/usr/bin/six-cli"
    install -Dm644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

