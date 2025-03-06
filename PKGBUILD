# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202503051
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/89e6de34b8e1897d3bc980b0bfca7c751210c2db/archives/dove.zip")
sha512sums=('7ad4df0777c3ef857de04ac374a6c10301a4f7605dc484ae7a87a484ce7116946266e3690be49937efe3f950a8ac92a31f9380af52cb9cfcb599362a40b09326')

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
