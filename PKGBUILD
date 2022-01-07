# Maintainer: Lucas Steinmann <lucas@steinm.net>
pkgname=archive-mount-nautilus-git
pkgver=r7.9b3e27a
pkgrel=1
pkgdesc="Nautilus extension for mounting archives via context menu."
arch=('any')
url="https://github.com/Lucas-Steinmann/archive-mount-nautilus"
license=('custom')
depends=('python-nautilus' 'gvfs')
makedepends=('git')
optdepends=()
install="nautilus-reminder.install"
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$pkgname"
    install -Dm755 archive-mount.py "$pkgdir/usr/share/nautilus-python/extensions/archive-mount.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

