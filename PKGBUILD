# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=firefox-profile-switcher-connector
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.1.1
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
makedepends=('cargo' 'cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('49c35024754eab5d05d4a266b7d03e0541e0e595ae8a0925424cd2eb37163cc1')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "target/release/firefox_profile_switcher_connector" "$pkgdir/usr/bin/ff-pswitch-connector"
    install -Dm755 "manifest/manifest-linux.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json"
}
