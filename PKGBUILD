# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=firefly-iii
pkgver=4.7.1.4
pkgrel=1
pkgdesc='PHP personal finances manager'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('custom')
depends=('php-intl')
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('53c11e8e3bae114e17d36df1497f1c9840814ee03dad4d12499bb30d6f2201df')

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
