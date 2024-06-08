# Contributor: Sean Snell <ssnell@lakecs.net>
# Contributor: Paul Stoetzer <n8hm at arrl dot net>

pkgname=predict
pkgver=2.3.1
pkgrel=1
pkgdesc='Satellite tracking, orbital prediction, open-source software'
arch=('i686' 'x86_64')
url="http://www.qsl.net/kd2bd/predict.html"
license=('GPL-2.0-or-later')
depends=('glibc' 'ncurses' 'alsa-lib')
options=('!emptydirs')
source=("https://www.qsl.net/kd2bd/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3ea626cadf1edf984e49e91891f9fd5cb38f6d83c5cd6e6693e8aecb2d289056')


build() {
    cd ${pkgname}-${pkgver}
    # Because the configure script does everything, it cannot really be used
    # Build predict
    ./build
    # Build earthtrack
    cd clients/earthtrack
    ./build
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 predict -t "$pkgdir/usr/bin/"
    install -Dm755 xpredict -t "$pkgdir/usr/bin/"
    install -Dm755 kepupdate -t "$pkgdir/usr/bin/"
    install -Dm755 clients/earthtrack/earthtrack -t "$pkgdir/usr/bin/"
    install -Dm644 docs/man/predict.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
