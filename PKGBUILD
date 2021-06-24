# Maintainer: Weihao Jiang <weihau dot chiang at gmail dot com>
pkgname=sjtu-dnscrypt-accel-git
pkgver=r127484.29427213ce
pkgrel=1
pkgdesc="SJTU DNS acceleration configuration for DNScrypt-proxy"
arch=(any)
license=('custom:WTFPL')
depends=('dnscrypt-proxy')
makedepends=(git)
backup=("etc/sjtudnscrypt.conf")
source=('list::git+https://github.com/felixonmars/dnsmasq-china-list')
sha256sums=('SKIP')

pkgver() {
  # Uses dnsmasq-china-list revisions as the pkgver.
  cd "${srcdir}/list"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/list"
    make SERVER="202.120.2.101, 202.120.2.100" dnscrypt-proxy
}


package() {
  install -Dm755 "${srcdir}/list/dnscrypt-proxy-forwarding-rules.txt" "${pkgdir}/etc/sjtudnscrypt.conf"
  install -Dm644 "${srcdir}/list/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
 
