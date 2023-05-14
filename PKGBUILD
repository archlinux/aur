# Maintainer: Ivan Gabaldon <aur[at]inetol[dot]net>
# Contributor: Kim Brandt <myrveln@gmail.com>
# Contributor: Vinh Nguyen <kurei [at] axcoto.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=newrelic-php5
pkgver=10.9.0.324
_libver=20210902
pkgrel=1
pkgdesc='PHP Monitoring Agent'
arch=('x86_64')
url='https://newrelic.com/php'
license=('Apache')
depends=('php')
backup=('etc/php/conf.d/newrelic.ini')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://download.newrelic.com/php_agent/archive/$pkgver/$pkgname-$pkgver-linux.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('aff4c634414cd8acd6588d92bea998b7d6b556fa4d6d208df0118180630e04387ca3da0b0af071b7099f15c282a64e04693c7831369d41da7462bd3f75ae49e2')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/daemon/newrelic-daemon.x64" "$pkgdir/usr/bin/newrelic-daemon"

    install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x64/newrelic-$_libver-zts.so" "$pkgdir/usr/lib/php/modules/newrelic-zts.so"
    install -Dm755 "$srcdir/$pkgname-$pkgver/agent/x64/newrelic-$_libver.so" "$pkgdir/usr/lib/php/modules/newrelic.so"

    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.ini.template" "$pkgdir/etc/php/conf.d/newrelic.ini.template"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic.ini.template" "$pkgdir/etc/php/conf.d/newrelic.ini"
    install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/newrelic-daemon.service" "$pkgdir/usr/lib/systemd/system/newrelic-daemon.service"

    install -Dm644 "$srcdir/$pkgname-$pkgver/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
