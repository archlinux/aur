# $Id$
# Maintainer: CountMurphy <spartan1086@gmail.com>
pkgname=mediatracker
__pkgname="MediaTracker"
pkgver=0.2.5
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/bonukai/MediaTracker.git"
pkgdesc="Self hosted platform for tracking movies, tv shows, video games, books and audiobooks."
license=('MIT')
depends=('nodejs-lts-iron' 'sqlite')
conflicts=(mediatracker-git)
makedepends=('npm')
source=("https://github.com/bonukai/MediaTracker/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(b3df530a89c54cbf61ea82ea70c75d3dbe0e00b48dfd4e895ba1f7c5bae4b24650bbdf46ca6def6b2a2c864249ac2c78cbf5d9b80bf8a1a84ab2d8933cc71af2)


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


