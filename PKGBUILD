# Maintainer: sashok724 <archlinux at sashok724 dot net>

_pkgname=async-profiler
pkgname=async-profiler-git
pkgver=r386.4b5a17b
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events'
arch=('x86_64')
url='https://github.com/jvm-profiling-tools/async-profiler'
license=('Apache')
provides=('async-profiler')
conflicts=('async-profiler')
groups=('jvm-profiling-tools')
depends=('java-environment' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make all
}

package() {
  cd $_pkgname

  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/opt/async-profiler/build/"

  install -m644 "build/libasyncProfiler.so" "build/async-profiler.jar" "$pkgdir/opt/async-profiler/build/"
  install build/jattach "$pkgdir/opt/async-profiler/build/"
  install profiler.sh "$pkgdir/opt/async-profiler/"
  ln -s "$pkgdir/opt/async-profiler/profiler.sh" "$pkgdir/usr/bin/async-profiler"
}
