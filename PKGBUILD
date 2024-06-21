pkgname=libhdhomerun-git
pkgver=20231109.r46.e8f29fd
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device, from git"
arch=(x86_64)
url="https://github.com/Silicondust/libhdhomerun"
license=('LGPL')
provides=('libhdhomerun')
conflicts=('libhdhomerun')

source=("git+https://github.com/Silicondust/libhdhomerun.git")
sha512sums=('SKIP')

pkgver() {
  cd libhdhomerun
  printf "%s.r%s.%s" $(git --no-pager log -1 --pretty='format:%cd' --date='format:%Y%m%d') "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd libhdhomerun
  make
  make hdhomerun_discover_example
}

package() {
  cd libhdhomerun

  install -D -m 644 *.h -t $pkgdir/usr/include/libhdhomerun/
  install -D -m 755 libhdhomerun.so $pkgdir/usr/lib/libhdhomerun.so
  install -D -m 755 hdhomerun_config $pkgdir/usr/bin/hdhomerun_config
  install -D -m 755 hdhomerun_discover_example $pkgdir/usr/bin/hdhomerun_discover_example
}
