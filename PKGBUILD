# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202503171
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/celenity/Dove/raw/commit/897f6494faad2496c5247a5c139b2c2e00cc1537/archives/dove.zip")
sha512sums=('6889d7d7368b7aaeeaab68cd104abd1098dcceed1823378faab1b560e8db86ee8f376de595be1087a2669a1df0bebfd7667310ac1a383a4a099e99c46a2dec47')
makedepends=('unzip')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/${pkgname}-${pkgver}.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/prefs/dove.js" "$pkgdir/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/etc/profile.d/dove-env-overrides.sh" "$pkgdir/etc/profile.d/dove-env-overrides.sh"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/usr/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/COPYING" "$pkgdir/usr/share/doc/dove/COPYING"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove/README.md"

    rm -rf "$tmpdir"
}
