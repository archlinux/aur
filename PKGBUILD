# Maintainer: Brian Allred <brian.d.allred at gmail dot com>

pkgname=docker-waiter
pkgver=0.3.0
pkgrel=1
pkgdesc='Docker container startup order controller'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://gitlab.com/BrianAllred/docker-waiter'
license=('MIT')
install='docker-waiter.install'
makedepends=('go' 'git')
source=("https://gitlab.com/BrianAllred/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "docker-waiter.install"
        "docker-waiter.service"
        "config-example.json")
md5sums=('c0dd88ab77ef1830dd2294a44fded4a9'
         'c059894cba8a0928149da701d2e351c8'
         'b532409b1cf2556410c1b30941e55e75'
         '864d974c4acb0ed6d34af7069f2ec1f2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -v -i -o "$srcdir/$pkgname"
    go clean --modcache
}

package() {
    install -D -m 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -D -m 0644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -D -m 0644 config-example.json "$pkgdir/etc/$pkgname/config-example.json"
}
