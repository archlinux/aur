# Maintainer: Mahmoud Almezali

pkgname=conky-manager-g-bin
pkgver=0.7
pkgrel=2
pkgdesc='Conky theme manager with a modern UI.'
arch=('x86_64')
url='https://github.com/almezali/conky-manager-g'
license=('MIT')
depends=('gtk3')
provides=('conky-manager-g')
conflicts=('conky-manager-g')

_source_url='https://gitlab.com/apps4linux/run.over.any/-/raw/main/conky-manager-g.tar.xz'
source=("conky-manager-g.tar.xz::${_source_url}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"

    # The upstream archive contains these files at its root.
    for required in conky-manager-g conky-manager-g.desktop conky-manager-g.svg README.txt; do
        if [[ ! -e "$required" ]]; then
            printf 'Error: required file is missing from the archive: %s\n' "$required" >&2
            return 1
        fi
    done

    chmod 755 conky-manager-g
    chmod 644 conky-manager-g.desktop conky-manager-g.svg README.txt
}

package() {
    cd "$srcdir"

    install -Dm755 conky-manager-g "$pkgdir/usr/bin/conky-manager-g"
    install -Dm644 conky-manager-g.desktop "$pkgdir/usr/share/applications/conky-manager-g.desktop"
    install -Dm644 conky-manager-g.svg "$pkgdir/usr/share/pixmaps/conky-manager-g.svg"
    install -Dm644 README.txt "$pkgdir/usr/share/doc/conky-manager-g/README.txt"
}

# vim:set ts=4 sw=4 et:
