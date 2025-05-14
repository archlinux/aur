# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-flatpak
pkgver=202505131
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/celenityy/Dove/-/raw/62dd494911304cd9c96685ee8c708f312cab9a67/archives/dove.zip")
sha512sums=('e69e6c19630f84882ed0f85c4f8a88c5e200a1690fe6db646ce9310eba31757dffa9d766f9928a3fafcf6912044796abaccdfd256df62c11caf7dd26a3c5263b')
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
