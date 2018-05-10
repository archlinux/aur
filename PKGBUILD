# Maintainer: nroi <nroi@mailbox.org>
pkgname=clyde-server-git
pkgver=r24.77de0a8
pkgrel=1
pkgdesc="Download pacman packages nightly for cpcache"
arch=('any')
url="https://github.com/nroi/clyde-server"
source=('git+https://github.com/nroi/clyde-server.git')
license=('MIT')
depends=('python' 'python-toml')
sha256sums=('SKIP')
depends=('python')

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 clyde_server "${pkgdir}/usr/bin/clyde_server"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 clyde_server.timer "${pkgdir}/usr/lib/systemd/system/clyde_server.timer"
    install -Dm644 clyde_server.service "${pkgdir}/usr/lib/systemd/system/clyde_server.service"
    install -Dm644 conf/config.toml "${pkgdir}/etc/clyde_server/config.toml"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
