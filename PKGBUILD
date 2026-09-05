# Maintainer: Piotr Krzemiński <pio dot krzeminski at gmail dot com>
# Managed from krzemin/mpxcast packaging revision: cc1ff62eefcf5afcb051bd961e7f52b96ea66f8c

pkgname=mpxcast
pkgver=1.1.0
pkgrel=1
pkgdesc='FM radio streaming server for RTL-SDR USB receivers'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/krzemin/mpxcast'
license=('GPL-2.0-or-later')
depends=('libmicrohttpd' 'liquid-dsp' 'rtl-sdr')
makedepends=('cmake')
backup=('etc/conf.d/mpxcast')
source=("$pkgname-$pkgver.tar.gz::https://github.com/krzemin/mpxcast/archive/refs/tags/v$pkgver.tar.gz"
        'mpxcast.service'
        'mpxcast.conf'
        'mpxcast.sysusers')
sha256sums=('73471c99ae0aa5fdaa4e84040dde60d38efcd9cdd2e5bc925de0bd2c77b70445'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    cmake -S "$pkgname-$pkgver" -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -Dm755 "$srcdir/build/mpxcast" "$pkgdir/usr/bin/mpxcast"
    install -Dm644 mpxcast.service "$pkgdir/usr/lib/systemd/system/mpxcast.service"
    install -Dm644 mpxcast.conf "$pkgdir/etc/conf.d/mpxcast"
    install -Dm644 mpxcast.sysusers "$pkgdir/usr/lib/sysusers.d/mpxcast.conf"
}
