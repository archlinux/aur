# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-flatpak
pkgver=202506061
pkgrel=1
pkgdesc="Dove is a suite of configurations & advanced modifications for Mozilla Thunderbird, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/celenityy/Dove/-/raw/1e20981f79337c9daed3586d0a135f23872519a0/archives/dove-linux.zip")
sha512sums=('5cc8c4ee277783d374506a3e8d6a08a32d29d2edddc454bde2a2d034f4c2073332221b91081156018b92597e0bf2e326f356c0580f15c4bda72255fa7fe7e0de')
makedepends=('unzip')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/${pkgname}-${pkgver}.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/defaults/pref/dove.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/etc/thunderbird/defaults/pref/dove.js"
    install -Dm644 "$tmpdir/dove.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/lib/thunderbird/dove.cfg"
    install -Dm644 "$tmpdir/policies/policies.json" "$pkgdir/var/lib/flatpak/app/org.mozilla.Thunderbird/current/active/files/etc/thunderbird/policies/policies.json"
    install -Dm644 "$tmpdir/COPYING" "$pkgdir/usr/share/doc/dove-flatpak/COPYING"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/dove-flatpak/README.md"

    rm -rf "$tmpdir"
}
