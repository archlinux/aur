# Maintainer: Fabian Muscariello <nroi@mailbox.org>

pkgname=inwx_update_dyndns-git
pkgver=r25.1d61d09
pkgrel=1
pkgdesc="Update A and AAAA records for your INWX DynDNS account"
arch=('any')
url="https://github.com/nroi/inwx_update_dyndns"
source=('git+https://github.com/nroi/inwx_update_dyndns.git')
license=('MIT')
sha256sums=('SKIP')
depends=('python' 'python-requests' 'python-toml')
backup=('etc/inwx_update_dyndns.toml')

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 ${pkgname%-git} "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 example_config.toml "${pkgdir}/etc/inwx_update_dyndns.toml"
    install -Dm644 ${pkgname%-git}.service "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
