# Maintainer: Fallstar <fallstar at daze dot pw>
pkgname=reaction-git
pkgver=r192.014a53f
pkgrel=2
pkgdesc="A daemon that scans program outputs for repeated patterns, and takes action. Alternative to fail2ban"
arch=('any')
url="https://framagit.org/ppom/reaction"
license=('AGPL')
makedepends=('git' 'go' 'gcc')
provides=('reaction' 'ip46tables')
source=("${pkgname}::git+https://framagit.org/ppom/reaction.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${pkgname}"
    make
}

package() {

    install -Dm755 "${pkgname}/reaction" "${pkgdir}/usr/bin/reaction"
    install -Dm755 "${pkgname}/ip46tables" "${pkgdir}/usr/bin/ip46tables"
    install -Dm755 "${pkgname}/nft46" "${pkgdir}/usr/bin/nft46"
    install -Dm644 "${pkgname}/config/reaction.example.service" "${pkgdir}/usr/lib/systemd/system/reaction.service"
    install -Dm644 "${pkgname}/config/example.jsonnet" "${pkgdir}/etc/reaction.jsonnet"
}
