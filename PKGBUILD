# $Id$
# Maintainer: CountMurphy <spartan1086@gmail.com>
pkgname=mediatracker
__pkgname="MediaTracker"
pkgver=0.2.4
pkgrel=3
arch=('i686' 'x86_64')
url="https://github.com/bonukai/MediaTracker.git"
pkgdesc="Self hosted platform for tracking movies, tv shows, video games, books and audiobooks."
license=('MIT')
depends=('nodejs-lts-iron' 'sqlite')
conflicts=(mediatracker-git)
makedepends=('npm')
source=("https://github.com/bonukai/MediaTracker/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(03f20ba8d1e752ec3c14c24ec7c917e941a6b608a786f2d70bf062cd08e69bd0285d439732642ae1c92958a8fe48eabaa742a9dc373c60d30da718a04c25d6f0)


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


