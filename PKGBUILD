# Maintainer: ASOwnerYT <asowneryt@protonmail.com>
# Contributor: Smartlinuxcoder <smartcoder@linuxmail.org>
pkgname=napture-git
pkgver=r365.18941be
pkgrel=1
pkgdesc="An alternative for the World Wide Web"
arch=('x86_64')
url="https://github.com/face-hh/webx"
license=('Apache-2.0')
depends=('glib2' 'gtk4' 'libadwaita' 'lua')
makedepends=('rust')
provides=('napture')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/webx/napture"
    cargo build --release
}

package() {
    cd "$srcdir/webx/napture"
    install -Dm755 "target/release/webx" "$pkgdir/usr/bin/napture"
    install -Dm644 "io.github.face_hh.Napture.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
    install -Dm644 "io.github.face_hh.Napture.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "io.github.face_hh.Napture.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

}

pkgver() {
    cd "$srcdir/webx"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
