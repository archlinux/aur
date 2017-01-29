# Maintainer: nroi <nroi@mailbox.org>
pkgname=clyde-git
pkgver=r5.1f4b658
pkgrel=1
pkgdesc="Download pacman packages nightly for cpcache"
arch=('any')
url="https://github.com/nroi/clyde"
source=('git+https://github.com/nroi/clyde.git')
license=('MIT')
depends=('python' 'python-yaml')
sha256sums=('SKIP')

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname%-git}.timer" "${pkgdir}/usr/lib/systemd//system/${pkgname%-git}.timer"
    install -Dm644 "${pkgname%-git}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
    install -Dm644 config.yml "${pkgdir}/etc/${pkgname%-git}/config.yml"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
