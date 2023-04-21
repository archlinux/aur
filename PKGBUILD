# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=js8call-wx_station
#pkgver=r18.6f34477
pkgver=0.3
pkgrel=2
pkgdesc="Upon request, report weather station data over JS8Call"
arch=('any')
url="https://github.com/skyl4rk/JS8Call-WX_Station"
license=('MIT')
makedepends=(git)
depends=(python python-requests js8call)
source=($pkgname::"git+$url.git#commit=6f344775e44430a79c4662ecab2f0e1688a8d6d8")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/$pkgname"
    #source scripts
    install -Dm755 js8net.py $pkgdir/opt/$pkgname/js8net.py
    install -Dm755 wx_station.py $pkgdir/opt/$pkgname/wx_station.py
    #systemd service
    install -Dm755 wx_station.service $pkgdir/etc/systemd/system/wx_station.service
} 
