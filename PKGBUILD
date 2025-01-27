# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202501271
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/d338eadafce4cc1b0e3aa5e8a83c2c42cf0e3723/archives/dove.zip")
sha512sums=('275b98ebcb08545270f4e31d5cff7b0c68c43a2c5155e136f94cad3e81fffd03a8f97e03e39e063c5f81748f9fba6ea0dc147c2af5a943ebcea03ecfb4a7d7e0')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/dove.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/filter.pac" "$pkgdir/etc/thunderbird/dove/resources/filter.pac"
    install -Dm644 "$tmpdir/prefs/dove.js" "$pkgdir/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/etc/profile.d/dove-env-overrides.sh" "$pkgdir/etc/profile.d/dove-env-overrides.sh"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/usr/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove/README.md"

    rm -rf "$tmpdir"
}
