# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=qqbot
pkgver=2.3.10
pkgrel=1
pkgdesc="A conversation robot base on Tencent's SmartQQ"
arch=('any')
url="https://github.com/pandolia/qqbot"
license=('MIT')
depends=("python" "python-apscheduler" "python-certifi" "python-requests")
optdepends=("gvfs: Automatically pop up QR code image"
            "python-pillow: For cmdQrcode"
            "python-wcwidth: For cmdQrcode"
            "shotwell: Automatically pop up QR code image"
            "python-selenium: For passwordlogin"
            "firefox: For webdriver in passwordlogin (or chromium)"
            "chromium: For webdriver in passwordlogin (or firefox)"
            "phantomjs: For webdriver in passwordlogin (no GUI)")
source=("https://github.com/pandolia/qqbot/archive/v$pkgver.tar.gz"
        "qqbot.service")
sha512sums=("c72f8a1c153c97a50adfaeb7704cbdacebcdd01b4a603e1a34ab571447cf3a2747c4da6480f7ce070eccd2b7fe5e3306924a111be1f680947fab245ee266a813"
            "9cf0eb4c82adff3ae4d793bedae13a6e83936b3aca8fc59b4f530b439c0913eaa375f07482cb1f58a9c10d7fd86ba1d1ab9304b4b89c87f637414bee1be9611e")

build() {
    cd "$srcdir"/qqbot-$pkgver
    python setup.py build
}

package() {
    cd qqbot-$pkgver
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
}
