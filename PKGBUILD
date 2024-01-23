# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=async-profiler
pkgver=3.0
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/jvm-profiling-tools/async-profiler'
license=('Apache')
provides=('async-profiler')
groups=('jvm-profiling-tools' 'odnoklassniki')
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jvm-profiling-tools/async-profiler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea03592e98989cce3bf06de9309ae88c8122668bf1a036a3e27a700879c88c13')
install=async-profiler.install

build() {
  cd "$pkgname-$pkgver"
  make all
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/async-profiler/lib"
  install -m 644 build/lib/async-profiler.jar build/lib/converter.jar "$pkgdir/opt/async-profiler/lib"
  install build/lib/libasyncProfiler.so "$pkgdir/opt/async-profiler/lib"
  install -d "$pkgdir/opt/async-profiler/bin"
  install build/bin/asprof "$pkgdir/opt/async-profiler/bin"
}
