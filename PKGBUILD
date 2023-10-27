# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>
# Contributor: Leszek Lesner <leszek@zevenos.com>
# Contributor: Lane Kohen < fx@hi2.in >

_pkgname=kf5-servicemenus-rootactions
pkgname=$_pkgname-git
pkgver=r16.cdfe53f
pkgrel=3
pkgdesc="Allows admin users to perform several root only actions from dolphin via polkit agent"
arch=(any)
url="https://www.opencode.net/netrunner/rootactions-servicemenu"
license=(GPL)
groups=(admin)
depends=(dolphin kdialog perl polkit)
optdepends=(kate)
provides=($_pkgname)
conflicts=($_pkgname kde-servicemenus-rootactions rootactions-servicemenu-git)
replaces=(rootactions-servicemenu-git)
source=("$_pkgname::git+https://www.opencode.net/netrunner/rootactions-servicemenu.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"

    install -Dm 644 "usr/share/kservices5/ServiceMenus/10-rootactionsfolders.desktop" "$pkgdir/usr/share/kservices5/ServiceMenus/10-rootactionsfolders.desktop"
    install -Dm 644 "usr/share/kservices5/ServiceMenus/11-rootactionsfiles.desktop" "$pkgdir/usr/share/kservices5/ServiceMenus/11-rootactionsfiles.desktop"
    install -Dm 755 "usr/bin/rootactions-servicemenu.pl" "$pkgdir/usr/bin/rootactions-servicemenu.pl"
    install -Dm 644 "usr/share/polkit-1/actions/com.netrunner.pkexec.rootactions.policy" "$pkgdir/usr/share/polkit-1/actions/com.netrunner.pkexec.rootactions.policy"
}
