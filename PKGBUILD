# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=async-profiler
pkgver=4.2
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/async-profiler/async-profiler'
license=('Apache')
provides=('async-profiler')
groups=('async-profiler')
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/async-profiler/async-profiler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75b323a289a6469378cbc6084b824f8a76be2354cad9779513931a491e69a6ae')
install=async-profiler.install

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
}
