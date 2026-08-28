# Maintainer: Piotr Krzemiński <pio dot krzeminski at gmail dot com>
# Managed from krzemin/mpxcast packaging revision: 9f5109d6022c7c4e99d5bf9386efacefc6cb1011

pkgname=mpxcast
pkgver=1.0.0
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
sha256sums=('4c02d5ce7009431c191acf4cb8a25b384ccf22a2e17b4ade60a0739f9cf98b18'
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
