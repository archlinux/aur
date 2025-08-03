# Maintainer: AnmiTaliDev <anmitali198@gmail.com>

pkgname=pasgtk4-git
_pkgname=pasgtk4
pkgver=r3.a332458
pkgrel=1
pkgdesc="Modern Pascal bindings for GTK4 with LibAdwaita support (development version)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/AnmiTaliDev/pasgtk4"
license=('Apache-2.0')
depends=('gtk4' 'libadwaita')
makedepends=('git')
optdepends=(
    'gnome-themes-extra: Additional themes'
    'adwaita-icon-theme: Default icons'
)
provides=('pasgtk4')
conflicts=('pasgtk4')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    
    # Install source files
    install -dm755 "$pkgdir/usr/include/pasgtk4"
    install -Dm644 src/*.pas "$pkgdir/usr/include/pasgtk4/"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Create pkg-config file
    install -dm755 "$pkgdir/usr/lib/pkgconfig"
    cat > "$pkgdir/usr/lib/pkgconfig/pasgtk4.pc" << EOF
prefix=/usr
includedir=\${prefix}/include
libdir=\${prefix}/lib

Name: PasGTK4
Description: Modern Pascal bindings for GTK4 with LibAdwaita support (git version)
Version: $pkgver
Requires: gtk4, libadwaita-1
Cflags: -I\${includedir}/pasgtk4
EOF
}

# vim:set ts=2 sw=2 et:
