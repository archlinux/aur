# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname="tableplus"
pkgver=0.1_16
pkgrel=1
pkgdesc="Modern, native, and friendly GUI tool for relational databases (Alpha Release)"
arch=("x86_64")
url="https://tableplus.com/linux/install"
license=("custom")
depends=("libsoup" "gtksourceview3" "libgee")
source=("https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver//_/-}_amd64.deb"
        "LICENSE")
sha256sums=("e16579e846ffcd5e4361818ed3db13c9fb725eb486fc4b5646fcbc679c87de9a"
            "76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb")

prepare() {
    tar -xf data.tar.xz
}

package() {
    # Install binary
    mkdir -p "$pkgdir/usr/local/bin/"
    install -Dm755 "$srcdir/opt/tableplus/tableplus" "$pkgdir/usr/local/bin/"

    # Install supporting files
    mkdir -p "$pkgdir/opt/tableplus/resource/"
    cp -r "$srcdir//opt/tableplus/resource" "$pkgdir/opt/tableplus/"
    chown -R root: "$pkgdir/opt/tableplus"
    chmod -R 0755 "$pkgdir/opt/tableplus"

    # Install .desktop file
    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/opt/tableplus/tableplus.desktop" "$pkgdir/usr/share/applications/"

    # Installl custom license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
