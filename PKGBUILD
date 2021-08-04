# Maintainer: Amin Vakil <info AT aminvakil DOT com>
pkgname=docker-bench-security-git
pkgver=1.3.5.r142.gdfb3a90
pkgrel=2
pkgdesc="Check common best-practices around deploying Docker container"
arch=('any')
url="https://github.com/docker/docker-bench-security"
license=('Apache')
conflicts=('docker-bench-security')
provides=('docker-bench-security')
source=("git+$url.git"
        "${pkgname/-git/}-exec.sh")
depends=(docker)
makedepends=('git')
sha256sums=('SKIP'
            'cd14edcb0f5c5cf05a51ba6e01c9a01d45e88738fda2ae56e31dc1f8af29025d')

pkgver() {
  cd "${pkgname/-git/}"
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm 755 "${pkgdir}/opt/${pkgname/-git/}"
    install -Dm 755 ../"${pkgname/-git/}"-exec.sh "${pkgdir}/usr/bin/${pkgname/-git/}"
    cp -r "${srcdir}/${pkgname/-git/}/"* "${pkgdir}/opt/${pkgname/-git/}"
}
