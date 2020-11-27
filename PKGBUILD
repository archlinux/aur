# Maintainer: SpineEyE <at gmail - com>

pkgname=hsphfpd-git
pkgdesc="Prototype implementation for connecting Bluetooth devices with HSP and HFP profiles"
pkgver=r19.58ffbf8
pkgrel=1
arch=(x86_64)
url=https://github.com/pali/hsphfpd-prototype
license=(unknown)
depends=(perl-net-dbus)
makedepends=(git)
optdepends=()
provides=("${pkgname%-git}")
source=(${pkgname%-git}::git+https://github.com/pali/hsphfpd-prototype.git
    ${pkgname%-git}.service
    telephony_client.service)
md5sums=('SKIP'
         '7fb422837e52fbe1fbc8c274839ed37f'
         'e5554f27c459c409cb96abddd463665a')

pkgver() {
    cd ${pkgname%-git}/
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 ${pkgname%-git}.service -t "$pkgdir"/usr/lib/systemd/system
    install -Dm644 telephony_client.service -t "$pkgdir"/usr/lib/systemd/user
    cd ${pkgname%-git}/
    install -Dm644 org.hsphfpd.conf -t "$pkgdir"/etc/dbus-1/system.d
    install -Dm755 hsphfpd.pl -t "$pkgdir"/usr/bin
    install -Dm755 telephony_client.pl -t "$pkgdir"/usr/bin
    install -Dm755 sco_features.pl -t "$pkgdir"/usr/bin
}
