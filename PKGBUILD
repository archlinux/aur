# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202501201
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("https://codeberg.org/celenity/Dove/raw/commit/f4fc610bdd33d9cce27a1e3dfd562a2d625cd711/archives/dove.zip")
sha512sums=('a42e2015e2fb7b6259b6620ef25887ce83aaa3eebb34d18675a5f5f2893a5829eb9801c693a90f032940794dcd093509819925c1bde8944e1f58d43f8a51263b')

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
