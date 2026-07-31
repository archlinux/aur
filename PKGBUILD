# Maintainer: 7MS8
pkgname=livepackageloader-git
pkgver=r2.34273f2
pkgrel=1
pkgdesc="Dynamic on-demand package loader for live Linux ISOs: pull software from a secondary desktopfs.sfs into a running live system via a YAD dialog, with RAM/OOM safety checks"
arch=('any')
url="https://github.com/7MS8/LivePackageLoader"
license=('GPL-3.0-or-later')
depends=('yad' 'dpkg' 'polkit')
makedepends=('git')
provides=('livepackageloader')
conflicts=('livepackageloader')
source=("$pkgname::git+https://github.com/7MS8/LivePackageLoader.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 src/lpm-runtime.sh "$pkgdir/usr/bin/lpm-runtime.sh"
    install -Dm644 share/applications/lpm.desktop "$pkgdir/usr/share/applications/lpm.desktop"
    sed -i 's|/usr/local/bin/lpm-runtime.sh|/usr/bin/lpm-runtime.sh|' \
        "$pkgdir/usr/share/applications/lpm.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
