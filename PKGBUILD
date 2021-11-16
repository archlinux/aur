# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=async-profiler
pkgver=2.5
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/jvm-profiling-tools/async-profiler'
license=('Apache')
provides=('async-profiler')
groups=('jvm-profiling-tools' 'odnoklassniki')
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jvm-profiling-tools/async-profiler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4edeadde01368f89efe3a880b24db7dbe9f96aca258de7cf0ddf13a0a83bde64')
install=async-profiler.install

build() {
  cd "$pkgname-$pkgver"
  make all
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/async-profiler/build"
  install -m 644 build/async-profiler.jar build/converter.jar "$pkgdir/opt/async-profiler/build"
  install build/libasyncProfiler.so build/jattach build/fdtransfer "$pkgdir/opt/async-profiler/build"
  install profiler.sh "$pkgdir/opt/async-profiler/profiler.sh"
}
