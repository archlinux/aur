# $Id$
# Maintainer: CountMurphy <spartan1086@gmail.com>
pkgname=mediatracker
__pkgname="MediaTracker"
pkgver=0.2.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/bonukai/MediaTracker.git"
pkgdesc="Self hosted platform for tracking movies, tv shows, video games, books and audiobooks."
license=('MIT')
depends=('nodejs-lts-iron' 'sqlite')
conflicts=(mediatracker-git)
makedepends=('npm')
source=("https://github.com/bonukai/MediaTracker/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(5b90aa3ddf47ba16701a69277a3ef1532c0975ef601903fce4c32c255006c360771c730e7774db1f08d2a898e7ed12e5f56315cbd36e85f239656a8d6b126209)


build() {
  cd "$srcdir/MediaTracker-$pkgver"
  npm install
  npm run build
}

package() {
  mkdir -p $pkgdir/srv/MediaTracker
  cp -Ra $srcdir/MediaTracker-$pkgver/* "$pkgdir/srv/MediaTracker/"
  install=mediatracker.install
  install -Dm 644 ../mediatracker.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 ../mediatracker.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm 644 ../mediatracker.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}


