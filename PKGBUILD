# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202502141
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/5db7df9f3469819a9040fd3a207bd9b172091e68/archives/dove.zip")
sha512sums=('39b3f8000ff702d57ceb0ad1bc5f9c1951d91409a17b5e7d6b427a15d7d9384e0cb8e9138ca65244fb8b412116281a1b27774d4cd3af6faf2e4f1d47be3c9188')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/dove.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/prefs/dove.js" "$pkgdir/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/etc/profile.d/dove-env-overrides.sh" "$pkgdir/etc/profile.d/dove-env-overrides.sh"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/usr/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/COPYING" "$pkgdir/usr/share/doc/dove/COPYING"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove/README.md"

    rm -rf "$tmpdir"
}
