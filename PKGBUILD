# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=xlunch
pkgname=xlunch-git
pkgver=2.4.1.r1.g0468acc
pkgrel=1
pkgdesc="Graphical app launcher for X with little dependencies"
arch=('i686' 'x86_64')
url="http://xlunch.org/"
license=('GPL3')
depends=('sh' 'libx11' 'imlib2')
makedepends=()
checkdepends=()
optdepends=()
provides=('xlunch')
conflicts=('xlunch')
source=('git+https://github.com/Tomas-M/xlunch.git'
        'xlunch-create-entry'
        'xlunch-conf-gen.hook'
        'xlunch-conf-install.hook'
        'xlunch-conf-remove.hook')
md5sums=('SKIP'
         '914c8dbbf6fdf4925de0ebe1d4cc8ea7'
         '5cedcafe1ba39961a84f1634958ca478'
         'b3e91a3ded90c24d56a42df84124df29'
         'aa9654e2adae39523d5d56abd4cbca92')

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
	install -Dm644 ../xlunch-conf-gen.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-gen.hook
	install -Dm644 ../xlunch-conf-install.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-install.hook
	install -Dm644 ../xlunch-conf-remove.hook "$pkgdir"/usr/share/libalpm/hooks/xlunch-conf-remove.hook
}
