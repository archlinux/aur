# Maintainer: Brian Allred <brian.d.allred at gmail dot com>

pkgname=docker-waiter
pkgver=0.2.1
pkgrel=2
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
md5sums=('ad0660096881210e6237ef793962b060'
         'c059894cba8a0928149da701d2e351c8'
         'b532409b1cf2556410c1b30941e55e75'
         '289546697d1fd3074b3024f395c509fd')

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
