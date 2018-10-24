# Maintainer: Mike Mogenson <michael.mogenson@gmail.com>
pkgname=fetch-hosts
pkgver=1
pkgrel=1
pkgdesc="Fetch new adware and malware blocking hosts file from Steven Black's GitHub repo."
arch=('any')
depends=('curl')
license=('GPL')
source=('fetch-hosts.service' 'fetch-hosts.timer')
md5sums=('c18dc82875f0c74cdc0c419d4cdc68c2' 'fee12eb2cc54311af21e2f6be740895a')

package() {
    cd "$srcdir"

    SYSD="$pkgdir/usr/lib/systemd/system" # systemd services directory
    install -dm755 "$SYSD"
    install -m644 "fetch-hosts.service" "$SYSD"
    install -m644 "fetch-hosts.timer" "$SYSD"

    # heads up to enable systemd service
    echo -e "\e[32m" # green text
    echo "------------------------------------------------------------"
    echo "Run 'systemctl enable fetch-hosts.timer' to enable timer"
    echo "Enable either 'NetworkManager-wait-online.service' or"
    echo "    'systemd-networkd-wait-online.service' for timer to work"
    echo "------------------------------------------------------------"
    echo -e "\e[0m" # normal text
}
