# Maintainer: mzz2017 <mzz@tuta.io>
pkgname=keep-wg-alive-git
pkgver=20210920.r3.874c628
pkgrel=1
pkgdesc="Check and reconnect the wg interfaces automaticly."
arch=('any')
url="https://github.com/mzz2017/keep-wg-alive"
license=('MIT')
depends=('sh' 'systemd')
provides=('keep-wg-alive')
conflicts=('keep-wg-alive')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

package() {
    cd "$srcdir"/$pkgname
    
    # Binary
    install -Dm755 ./keep-wg-alive.sh          -t "$pkgdir"/usr/bin/
    
    # Documentation
    install -Dm644 ./README.md                 -t "$pkgdir"/usr/share/doc/keep-wg-alive
   
    # Intergration
    install -Dm644 ./systemd/*.{service,timer} -t "$pkgdir"/usr/lib/systemd/system
}

