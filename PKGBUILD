# Maintainer: Ethan Brittain-Morby <ebm539 at protonmail dot com>
pkgname=dsvpn-ipv6-git
pkgver=r221.9952bb8
pkgrel=2
pkgdesc="A Dead Simple VPN. (IPv6 branch)"
arch=('any')
url="https://github.com/jedisct1/dsvpn"
license=('MIT')
depends=('iproute2' 'gawk' 'iptables' 'procps-ng')
makedepends=('make' 'gcc' 'git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://github.com/jedisct1/dsvpn#branch=ipv6")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-ipv6-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-ipv6-git}"
  make
}

package() {
  cd "${pkgname%-ipv6-git}"
  install -Dm755 ${pkgname%-ipv6-git} "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}

