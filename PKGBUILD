# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=async-profiler
pkgver=4.4
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/async-profiler/async-profiler'
license=('Apache')
provides=('async-profiler')
groups=('async-profiler')
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/async-profiler/async-profiler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('888483f6fc482b32dfc76dc9ecb254dc954c1e5c893de325a895b41e2f9bbbf6')

build() {
  cd "$pkgname-$pkgver"
  make all
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/async-profiler/lib"
  install build/lib/libasyncProfiler.so "$pkgdir/opt/async-profiler/lib"
  install -d "$pkgdir/opt/async-profiler/jar"
  install -m 644 build/jar/async-profiler.jar build/jar/jfr-converter.jar "$pkgdir/opt/async-profiler/jar"
  install -d "$pkgdir/opt/async-profiler/bin"
  install build/bin/asprof "$pkgdir/opt/async-profiler/bin"
  install build/bin/jfrconv "$pkgdir/opt/async-profiler/bin"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/async-profiler/bin/asprof "$pkgdir/usr/bin/asprof"
  ln -s /opt/async-profiler/bin/jfrconv "$pkgdir/usr/bin/jfrconv"
}
