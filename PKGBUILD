# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=gnome-pass-search-provider-git
_pkgname=gnome-pass-search-provider
pkgver=r99.e0418d6
pkgrel=4
pkgdesc="Gnome Search provider for pass (zx2c4/passwordstore.org), gopass and compatibles and rbw (Bitwarden/Vaultwarden) that sends passwords to clipboard (or GPaste)"
arch=('any')
url="https://github.com/jle64/gnome-pass-search-provider"
license=('GPL')
depends=('python-gobject' 'python-dbus' 'python-thefuzz')
optdepends=('gpaste' 'pass' 'rbw' 'gopass')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('gnome-pass-search-provider::git+https://github.com/jle64/gnome-pass-search-provider.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$_pkgname"
        install -Dm 0755 gnome-pass-search-provider.py "$pkgdir/usr/lib/gnome-pass-search-provider/gnome-pass-search-provider.py"
        install -Dm 0644 conf/org.gnome.Pass.SearchProvider.ini "$pkgdir/usr/share/gnome-shell/search-providers/org.gnome.Pass.SearchProvider.ini"
        install -Dm 0644 conf/org.gnome.Pass.SearchProvider.desktop "$pkgdir/usr/share/applications/org.gnome.Pass.SearchProvider.desktop"
        install -Dm 0644 conf/org.gnome.Pass.SearchProvider.service.dbus "$pkgdir/usr/share/dbus-1/services/org.gnome.Pass.SearchProvider.service"
        install -Dm 0644 conf/org.gnome.Pass.SearchProvider.service.systemd "$pkgdir/usr/share/systemd/user/org.gnome.Pass.SearchProvider.service"
}
