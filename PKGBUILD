# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/everseer

pkgname=everseer-server-git
pkgver=0.1
pkgrel=1
pkgdesc='Electron based multi-machine system monitor, server version'
arch=('x86_64')
url='https://github.com/gabmus/everseer'
license=('GPLv3')
depends=('gtk2' 'python-psutil' 'pm2')
optdepends=('openssh: ssh support')
makedepends=('git' 'npm')
source=("everseer::git+git://github.com/gabmus/everseer")
md5sums=('SKIP')

build() {
  cd $srcdir/everseer/everseer-server
  echo $(head -n 30 /dev/urandom | sha512sum | cut -f1 -d' ') \
    > routes/APIKEY
}

package() {
  cd "$srcdir/everseer"
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/bin
  cp -r everseer-server $pkgdir/usr/share/everseer-server
  cp everseer-server/run.sh $pkgdir/usr/bin/everseer-server
}
