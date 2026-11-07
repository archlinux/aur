# Maintainer: Jussi Eloranta <eloranta@aa6kj.hopto.org>
pkgname=acom2000-git
pkgver=r24.457dcd6
pkgrel=1
pkgdesc="Remote control software for ACOM 2000A linear amplifier."
arch=('x86_64' 'aarch64')
url="https://github.com/jmeloranta/acom2000"
license=('GPL-3.0-or-later')
depends=('base-devel' 'pkgconf' 'gtk4' 'glibc' 'graphene' 'pango' 'glib2' 'harfbuzz' 'vulkan-icd-loader' 'cairo')
makedepends=('git')
sha256sums=('SKIP')
source=(git+"https://github.com/jmeloranta/acom2000.git")

pkgver() {
    cd "$srcdir/acom2000"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/acom2000"
    make
}

package() {
    cd "$srcdir/acom2000"
    install -Dm755 acom2000 "$pkgdir/usr/bin/acom2000"
    mkdir -p "$pkgdir/usr/share/applications"
cat > "$pkgdir/usr/share/applications/acom2000.desktop" << EOF
[Desktop Entry]
Version=1.0
Name=acom2000
Comment=Remote control software for ACOM 2000A linear amplifier
Exec=/usr/bin/acom2000
Type=Application
Categories=HamRadio;
Icon=acom2000_icon
Terminal=false
EOF
    chmod 644 "$pkgdir/usr/share/applications/acom2000.desktop"
    install -Dm644 acom2000.png "$pkgdir/usr/share/pixmaps/acom2000_icon.png"
}
