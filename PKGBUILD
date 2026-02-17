# Maintainer: Oly Ahamed <apurbo1336@email.com>

pkgname=fish-screen-time
pkgver=1.0.2
pkgrel=1
pkgdesc="Daily screen time tracker that shows in your Fish shell greeting"
arch=('any')
url="https://github.com/OlyAhamed/fish-screen-time"
license=('MIT')
depends=('fish' 'bash' 'systemd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab6f4b80011234de4f0ddfbf21d06b57ee0099b739c98525a9927c765be2763f')

package() {
    cd "$pkgname-$pkgver"

    # Install the tracker script
    install -Dm755 screen_time_tracker.sh \
        "$pkgdir/usr/lib/$pkgname/screen_time_tracker.sh"

    # Install the fish function
    install -Dm644 show_screen_time.fish \
        "$pkgdir/usr/share/fish/vendor_functions.d/show_screen_time.fish"

    # Install the systemd user service
    install -Dm644 screen-time-tracker.service \
        "$pkgdir/usr/lib/systemd/user/screen-time-tracker.service"

    # Install the post-install script
    install -Dm644 fish-screen-time.install \
        "$pkgdir/usr/share/$pkgname/post-install.txt"
}
