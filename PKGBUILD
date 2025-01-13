# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202501131
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/1de785d312817360debe3f1dc227cf1aaaf1813a/archives/dove.zip")
sha512sums=('c43ca6c8a2b4ef2035edec8b34614b9b6c43a95c61776e489131b6024b59873cd41d871d3c198a729a1cd689b9e5c63533a86efb105c9018a084b06241ab548f')

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
