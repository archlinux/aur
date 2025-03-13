# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-flatpak
pkgver=202503121
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/celenity/Dove/raw/commit/6e5c8fc8c129b0414c8da0aa89ca3ef4b2022d7f/archives/dove.zip")
sha512sums=('4acffc7631b501a3225ab69fb73a023706056098798befbceabddaf47c6e26a59838138cf0cdb5d02990b764ea6298a671074a8a4ef129280599a810a97b710a')
makedepends=('unzip')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/${pkgname}-${pkgver}.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/prefs/dove.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/COPYING" "$pkgdir/usr/share/doc/dove-flatpak/COPYING"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove-flatpak/README.md"

    rm -rf "$tmpdir"
}
