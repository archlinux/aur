# Maintainer: Anthony Vitacco <anthony@littlegno.me>
pkgname=rhythmbox-plugin-ampache-git
pkgver=0d233e3
pkgrel=1
pkgdesc=" Rhythmbox plugin to stream music from Ampache"
arch=('any')
url="https://github.com/lotan/rhythmbox-ampache"
license=('GPL')
depends=('rhythmbox>=3.0' 'python')
makedepends=('git')
provides=('rhythmbox-plugin-ampache')
install="rhythmbox-plugin-ampache-git.install"
source=(${pkgname}::git+https://github.com/lotan/rhythmbox-ampache)
sha1sums=('SKIP')
replace=rhythmbox-ampache-svn

pkgver() {
    cd "${pkgname}"
    git describe --always | sed 's|-|.|g'
}

package() {
    mkdir -p $pkgdir/usr/share/rhythmbox/plugins/ampache
    mkdir -p $pkgdir/usr/share/glib-2.0/schemas/
    mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/ampache/
    
    cd "$srcdir/$pkgname"
    
    install -Dm644 *.py $pkgdir/usr/lib/rhythmbox/plugins/ampache/
    install -Dm644 ampache.plugin $pkgdir/usr/lib/rhythmbox/plugins/ampache/
    install -Dm644 ampache-prefs.ui $pkgdir/usr/share/rhythmbox/plugins/ampache
    install -Dm644 ampache.ico $pkgdir/usr/share/rhythmbox/plugins/ampache
    install -Dm644 ampache.png $pkgdir/usr/share/rhythmbox/plugins/ampache
    install -Dm644 org.gnome.rhythmbox.plugins.ampache.gschema.xml $pkgdir/usr/share/glib-2.0/schemas
}

