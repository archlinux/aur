# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-flatpak
pkgver=202504111
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/celenityy/Dove/-/raw/2e801a04408c3d8c769e393a06920665c834357a/archives/dove.zip")
sha512sums=('b979251f9434264baf0cc2552b1aea56ce998d2b69cfe641364200efa226a8739c097828796560f98bbaed57e97a9135e99fdbbc1c1096011d32103440d714ce')
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
