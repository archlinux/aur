# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=20241216
pkgrel=1
pkgdesc="Welcome to the next generation of Dove."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/9159668a25929e001b234508add58d210b1e307b/archives/dove.zip")
sha512sums=('77fe1913e68fb4c69bc27e7628d207856b12f3aad243181999ec10715f2ecb209c6da7b1fdc9993b504eb80c2c986012302bba868ec65ee710117243bb699ff8')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/dove.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/filter.pac" "$pkgdir/etc/thunderbird/dove/resources/filter.pac"
    install -Dm644 "$tmpdir/defaults/pref/dove.js" "$pkgdir/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/etc/profile.d/dove-env-overrides.sh" "$pkgdir/etc/profile.d/dove-env-overrides.sh"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/usr/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove/README.md"

    rm -rf "$tmpdir"
}
