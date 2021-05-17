# Maintainer: Luke Street <luke@street.dev>
pkgname=jetbrains-nautilus-git
pkgver=r2.6c901ae
pkgrel=1
pkgdesc="Nautilus extension for JetBrains Toolbox products"
arch=('any')
url="https://github.com/encounter/jetbrains-nautilus"
license=('custom')
depends=('python-nautilus')
makedepends=('git')
optdepends=('jetbrains-toolbox: For JetBrains product installation')
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
    install -Dm755 jetbrains-nautilus.py "$pkgdir/usr/share/nautilus-python/extensions/jetbrains-nautilus.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
