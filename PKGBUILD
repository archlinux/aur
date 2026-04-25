# Maintainer: Ken-ichi Yasuda <msredcomet06@gmail.com>
pkgname=mydns
pkgver=1.0.0
pkgrel=1
pkgdesc="MyDNS.JP IP update script with IPv4/IPv6 support and systemd timer"
arch=('any')
url="https://github.com/kenichyan/mydns"
license=('MIT')
depends=('bash' 'curl')
backup=('etc/mydns/mydns.conf')

# GitHubのReleaseからソースをダウンロードする設定
source=("$pkgname-$pkgver.tar.gz::https://github.com/kenichyan/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50ea36f533402498a2e33e6b2811dc8300dd0f65ddbbc65608720614a17649f8')

package() {
    cd "$pkgname-$pkgver"

    # 1. 実行スクリプトのインストール (chmod 755相当)
    install -Dm755 mydns-update.sh "$pkgdir/usr/bin/mydns-update"

    # 2. 設定ファイルのインストール (chmod 600相当)
    install -Dm600 mydns.conf "$pkgdir/etc/mydns/mydns.conf"

    # 3. Systemdファイルのインストール (chmod 644相当)
    install -Dm644 mydns-update.service "$pkgdir/usr/lib/systemd/system/mydns-update.service"
    install -Dm644 mydns-update.timer "$pkgdir/usr/lib/systemd/system/mydns-update.timer"
}
