# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=firefox-profile-switcher-connector
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.0.8
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('96884a699ddff75455e52b6071587d731f526996a76d5c2db7926f4af2f6f2ad')

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
