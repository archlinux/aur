# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=firefly-iii
pkgver=4.7.0
pkgrel=1
pkgdesc='PHP personal finances manager'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('custom')
depends=('php-intl')
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11452770b0722a14d27dd3198f4cfc6817ef4a4de27fd9fcd6b24524de50c9b8')

install=$pkgname.install
backup=(
    "etc/webapps/$pkgname/config.env"
    "etc/webapps/$pkgname/config.env.docker"
    "etc/webapps/$pkgname/config.env.sandstorm"
    "etc/webapps/$pkgname/config.env.testing")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "$pkgdir/usr/share/webapps" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -rv * "$pkgdir/usr/share/webapps"
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    mv -v '.env.example' '.env'
    mv -v ".env"* "$pkgdir/etc/webapps/$pkgname"

	for i in '' '.docker' '.sandstorm' '.testing' ; do
        mv -v "$pkgdir/etc/webapps/$pkgname/.env$i" "$pkgdir/etc/webapps/$pkgname/config.env$i"
    done
}

# vim:ts=4:sw=4:expandtab
