# Maintainer: Spoorloos <mick.negenman@icloud.com>

pkgname="geteduroam-cli-bin"
pkgver="0.12"
pkgrel=1
pkgdesc="geteduroam Linux client"
url="https://github.com/geteduroam/linux-app"
license=("BSD-3-Clause")
arch=("x86_64")
depends=("libnotify" "networkmanager")
source=("geteduroam-cli_linux_amd64.deb::$url/releases/download/$pkgver/geteduroam-cli_linux_amd64.deb"
        "LICENSE::$url/raw/refs/tags/$pkgver/LICENSE")
sha256sums=("a24f17ac6fb05327e5fcbbc201bc667cd2289f1cf1a8865a64fa59fdccd2c4af"
            "8d714baa7c1260c1eb4ad9c332feb3e27aade76faff0d4f672d4cbf4ffb95c45")

prepare() {
    tar -xzf "$srcdir/data.tar.gz"
}

package() {
    # Install systemd services
    install -Dm644 "$srcdir/etc/systemd/user/geteduroam-notifs.service" \
        "$pkgdir/etc/systemd/user/geteduroam-notifs.service"
    install -Dm644 "$srcdir/etc/systemd/user/geteduroam-notifs.timer" \
        "$pkgdir/etc/systemd/user/geteduroam-notifs.timer"

    # Install binaries
    install -Dm755 "$srcdir/usr/bin/geteduroam-cli" "$pkgdir/usr/bin/geteduroam-cli"
    install -Dm755 "$srcdir/usr/bin/geteduroam-notifcheck" "$pkgdir/usr/bin/geteduroam-notifcheck"

    # Install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
