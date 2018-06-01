# Maintainer: Pietro Francesco Fontana <pietrofrancesco.fontana@studenti.unimi.it>

_pkgname=cleanupdate
pkgname=cleanupdate-git
pkgver=r156.5abab4d
pkgrel=0
pkgdesc="A simple script to speed up updating and cleaning your system"
arch=('any')
url="https://github.com/cubanpit/$_pkgname"
license=('GPL3')
depends=('bash'
        'bc'
        'ncurses'
        'sudo')
makedepends=('git')
optdepends=('trizen: needed for AUR support (preferred to yaourt or pacaur)'
    'yaourt: needed for AUR support (preferred to pacaur)'
		'pacaur: needed for AUR support (alternative to trizen)')
conflicts=()
source=("git://github.com/cubanpit/$_pkgname")
md5sums=('SKIP')

pkgver() {
        cd ${_pkgname}
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
        cd "$srcdir"
        install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

        for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 ; do
                install -Dm644 "$srcdir/$_pkgname/icons/$_pkgname$i".png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname".png
        done
        install -Dm644 "$srcdir/$_pkgname/icons/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

        install -Dm644 "$srcdir/$_pkgname/man/$_pkgname-it.7.gz" "$pkgdir/usr/share/man/it/man7/$_pkgname.7.gz"
        install -Dm644 "$srcdir/$_pkgname/man/$_pkgname.7.gz" "$pkgdir/usr/share/man/man7/$_pkgname.7.gz"
}
