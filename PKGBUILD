# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
_githubusername=CachetHQ
_projname=Cachet
pkgname=cachet
pkgver=2.3.11
pkgrel=1
pkgdesc="An open source status page system for everyone."
arch=('any')
url="https://cachethq.io/"
license=('custom')
depends=('php-gd' 'python')
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_githubusername}/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('fb0f834103ae055ce55e869807d0e50ff1df79e214e241d70a36e5969ea50c97')

install='cachet.install'

package() {
    cd "$srcdir/$_projname-$pkgver"
    install -d "$pkgdir/usr/share/webapps/${pkgname}" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -r ./* ./.env.example "$pkgdir/usr/share/webapps/${pkgname}"
    php -dextension=gd.so /usr/bin/composer install --working-dir "$pkgdir/usr/share/webapps/${pkgname}" -o --no-dev
    install -D "$srcdir/$_projname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
    mv "$pkgdir/usr/share/webapps/$pkgname/.env.example" "$pkgdir/etc/webapps/$pkgname/config.env"

    ln -s "../../../../etc/webapps/${pkgname}/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
}

# vim:ts=4:sw=4:expandtab
