# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-flatpak
pkgver=202502211
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/218a7de7d78b0f5f371bb4fb3f61426faa9c6445/archives/dove.zip")
sha512sums=('eb599d0fdf1cc3fe1a5054d5fba2d53d2ff7eac340f721ad416dd560e5213f7b1255908ca1aeef327133821da8fa5c23f422fd9ffb45f8bfb3dabe6d5a44162f')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/dove.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/prefs/dove.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/COPYING" "$pkgdir/usr/share/doc/dove-flatpak/COPYING"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove-flatpak/README.md"

    rm -rf "$tmpdir"
}
