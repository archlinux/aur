# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=async-profiler
pkgver=1.8.3
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/jvm-profiling-tools/async-profiler'
license=('Apache')
provides=('async-profiler')
groups=('jvm-profiling-tools' 'odnoklassniki')
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jvm-profiling-tools/async-profiler/archive/v$pkgver.tar.gz")
sha256sums=('beb89384606816751cb763a90cbbbbd4618e760d67239ed9956d08a571a3e276')
install=async-profiler.install

build() {
  cd "$pkgname-$pkgver"
  make all
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/async-profiler/build"
  install build/libasyncProfiler.so build/jattach build/async-profiler.jar "$pkgdir/opt/async-profiler/build"
  install profiler.sh "$pkgdir/opt/async-profiler/profiler.sh"
}
