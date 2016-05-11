# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/everseer

pkgname=mlauncher-git
pkgver=0.2
pkgrel=1
pkgdesc='GTK app to create desktop files'
arch=('x86_64')
url='https://github.com/gabmus/mlauncher'
license=('GPLv3')
depends=('gtk3>=3.16')
makedepends=('git')
source=("mlauncher::git+git://github.com/gabmus/mlauncher")
md5sums=('SKIP')

prepare() {
  echo -e "#!/bin/sh\npython3 /usr/share/mlauncher/main.py" > $srcdir/run.sh
  chmod +x $srcdir/run.sh
}

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp -r mlauncher $pkgdir/usr/share/mlauncher
  cp mlauncher/mlauncher.desktop.in $pkgdir/usr/share/applications/mlauncher.desktop
  mv run.sh $pkgdir/usr/bin/mlauncher
}
