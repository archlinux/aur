# Contributor: Sean Snell <ssnell@lakecs.net>
# Contributor: Paul Stoetzer <n8hm at arrl dot net>

pkgname=predict
pkgver=3.0.2
pkgrel=1
pkgdesc='Satellite tracking, orbital prediction, open-source software'
arch=('i686' 'x86_64')
url="http://www.qsl.net/kd2bd/predict.html"
license=('GPL-2.0-or-later')
depends=('glibc' 'ncurses' 'alsa-lib')
options=('!emptydirs')
source=("https://www.qsl.net/kd2bd/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e1385de66c4740336be4c6bfabd3d5d4270dce4ba36642d608aa9787d6c3ae61')


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
    install -Dm755 clients/earthtrack/earthtrack -t "$pkgdir/usr/bin/"
    install -Dm644 docs/man/predict.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
