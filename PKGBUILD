# Maintainer: Weihao Jiang <weihau dot chiang at gmail dot com>
pkgname=sjtu-dnscrypt-accel
pkgver=r125654.72a0845284
pkgrel=2
pkgdesc="SJTU DNS acceleration configuration for DNScrypt-proxy"
arch=('any')
license=('MIT')
depends=('dnscrypt-proxy')

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
}
 
