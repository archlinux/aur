# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=firefly-iii
pkgver=4.6.5
pkgrel=1
pkgdesc='PHP personal finances manager'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('custom')
depends=('php-intl')
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0798dd0d068fc8527296e6bb4393db5c50fdad77a8fd07ef3f6fef4dbf91a007')

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
