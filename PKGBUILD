# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=pizarra-git
pkgver=1.6.0
pkgrel=1
pkgdesc='Simple Gtk drawing application'
arch=('i686' 'x86_64')
url='https://gitlab.com/categulario/pizarra-gtk'
license=('GPL3')
depends=('gtk3')
makedepends=('cargo' 'git')
provides=('pizarra')
conflicts=('pizarra')
source=('pizarra-git::git+https://gitlab.com/categulario/pizarra-gtk')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/pizarra "$pkgdir"/usr/bin/pizarra
    install -Dm644 res/pizarra.desktop "$pkgdir"/usr/share/applications/pizarra.desktop
    install -Dm644 res/icons/tk.categulario.pizarra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/pizarra.svg

    install -Dm644 README.md "$pkgdir"/usr/share/doc/pizarra/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/pizarra/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/pizarra/changelog
}
