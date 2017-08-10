# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=xlunch
pkgname=xlunch-git
pkgver=2.4.2.r45.g1687e4c
pkgrel=2
pkgdesc="Graphical app launcher for X with little dependencies"
arch=('i686' 'x86_64')
url="http://xlunch.org/"
license=('GPL3')
depends=('sh' 'libx11' 'imlib2')
makedepends=('git' 'gcc' 'make')
provides=('xlunch')
conflicts=('xlunch')
source=('git+https://github.com/Tomas-M/xlunch.git'
        'xlunch-create-entry'
        'xlunch-conf-gen.hook'
        'xlunch-conf-install.hook'
        'xlunch-conf-remove.hook')
md5sums=('SKIP'
         'a7fdfc89153e0ae50665484e8d02d069'
         '5cedcafe1ba39961a84f1634958ca478'
         'ccaf7547b8ceeb11badb2a08b3c592f7'
         '832317d10246dd7b2ac17c599b19f441')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
	make xlunch
}

package() {
    cd "$srcdir/$_pkgname"
	install -Dm755 xlunch "$pkgdir"/usr/bin/xlunch
	install -Dm755 extra/genconf "$pkgdir"/usr/bin/xlunch-genconf
	install -Dm755 extra/sample_config.cfg "$pkgdir"/etc/xlunch/icons.conf
	install -Dm755 ../xlunch-create-entry "$pkgdir"/usr/bin/xlunch-create-entry

	install -Dm644 extra/ghost.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/xlunch_ghost.png
	install -Dm644 ../xlunch-conf-gen.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-gen.hook
	install -Dm644 ../xlunch-conf-install.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-install.hook
	install -Dm644 ../xlunch-conf-remove.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-remove.hook
}
