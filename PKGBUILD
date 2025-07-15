# $Id$
# Maintainer: CountMurphy <spartan1086@gmail.com>
pkgname=mediatracker
__pkgname="MediaTracker"
pkgver=0.2.11
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/bonukai/MediaTracker.git"
pkgdesc="Self hosted platform for tracking movies, tv shows, video games, books and audiobooks."
license=('MIT')
depends=('nodejs-lts-jod' 'sqlite')
conflicts=(mediatracker-git)
makedepends=('npm')
source=(
"https://github.com/bonukai/MediaTracker/archive/refs/tags/v$pkgver.tar.gz"
  mediatracker.install
  mediatracker.service
  mediatracker.sysusers
  mediatracker.tmpfiles
)
sha512sums=(
  f7ca3d4bd02e38c6f7c14972fb20679258923c18a3820ef8160d4171531f9870dbe89eacd9e21796a0545ceaeb8f4a9d483dd6bb9e2cfdb4895399d6ef4e95aa
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)


build() {
  cd "$srcdir/MediaTracker-$pkgver"
  npm install
  npm run build
}

package() {
  mkdir -p $pkgdir/usr/share/webapps/MediaTracker
  cp -Ra $srcdir/MediaTracker-$pkgver/* "$pkgdir/usr/share/webapps/MediaTracker"
  install=mediatracker.install
  install -Dm 644 mediatracker.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 mediatracker.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm 644 mediatracker.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}


