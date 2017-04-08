# Maintainer: nroi <nroi@mailbox.org>

pkgname=clyde-client-git
pkgver=r6.ccafc3f
pkgrel=1
pkgdesc="Send currently installed packages to cpcache"
arch=('any')
url="https://github.com/nroi/clyde-client"
source=('git+https://github.com/nroi/clyde-client.git')
license=('MIT')
sha256sums=('SKIP')
depends=('python' 'inotify-tools' 'curl' 'sed' 'procps-ng' 'coreutils')
backup=('etc/clyde_client/key')

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "${pkgdir}/etc/clyde_client"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 clyde_client "${pkgdir}/usr/bin/clyde_client"
    install -Dm644 clyde_client.service "${pkgdir}/usr/lib/systemd/system/clyde_client.service"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
