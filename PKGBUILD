# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove
pkgver=202503201
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/celenity/Dove/raw/commit/95ece31474350b768d06bf2a1a2fcb73eb9e7c9b/archives/dove.zip")
sha512sums=('e9e3ec1dcf6f2abe22e365d351a3261fcbb039a89ef7b0075fead43887875879b1608c57b811e4331319ccd4b92ad48ac908c3a2b088e76272f74e73b9b47047')
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
