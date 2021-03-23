# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=async-profiler
pkgver=2.0
pkgrel=2
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/jvm-profiling-tools/async-profiler'
license=('Apache')
provides=('async-profiler')
groups=('jvm-profiling-tools' 'odnoklassniki')
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jvm-profiling-tools/async-profiler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5922c89524235855cd1810ffaacd032376e749dba7b33dafc57b3ea1814a409')
install=async-profiler.install

build() {
  cd "$pkgname-$pkgver"
  make all
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/async-profiler/build"
  install -m 644 build/async-profiler.jar build/converter.jar "$pkgdir/opt/async-profiler/build"
  install build/libasyncProfiler.so build/jattach "$pkgdir/opt/async-profiler/build"
  install profiler.sh "$pkgdir/opt/async-profiler/profiler.sh"
}
