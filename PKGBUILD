# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname=find-deleted-git
pkgver=r21.1b7f3d2
pkgrel=1
pkgdesc='Find deleted files which are still in use, and suggest systemd units to restart.'
arch=('any')
url='https://github.com/FauxFaux/find-deleted'
license=('MIT')
depends=('python-yaml')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/find-deleted/deleted.yml')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"

    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname%-git}"

    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 'deleted.yml' "${pkgdir}/etc/${pkgname%-git}/deleted.yml"

    install -Dm644 'LICENSE.MIT' "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
