# Maintainer: tkit <ch1994@outlook.com>
pkgname=code-nautilus-git
pkgver=r13.40b6d31
pkgrel=1
pkgdesc="VSCode extension for Nautilus"
arch=('i686' 'x86_64')
url="https://github.com/cra0zy/code-nautilus"
license=('custom')
depends=('python-nautilus')
makedepends=('git')
optdepends=('code: The Visual Studio Code (vscode) editor')
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
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
    install -Dm755 code-nautilus.py "$pkgdir/usr/share/nautilus-python/extensions/code-nautilus.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
