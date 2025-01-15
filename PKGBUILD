# $Id$
# Maintainer: CountMurphy <spartan1086@gmail.com>
pkgname=mediatracker
__pkgname="MediaTracker"
pkgver=0.2.9
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/bonukai/MediaTracker.git"
pkgdesc="Self hosted platform for tracking movies, tv shows, video games, books and audiobooks."
license=('MIT')
depends=('nodejs-lts-iron' 'sqlite')
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
  817d44f661f39deb9b1cad7717baa39f4431f348addd1e6569216af749d5186e34de385195b3e15ea8fb7538e4d637e342d50e08e4965082bcb72c1af9513ffa
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


