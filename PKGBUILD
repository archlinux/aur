# Maintainer: BigWebstas
#
# Packages the prebuilt `flutter build linux --release` bundle for Arch.
# Not source-built: the bundle tarball is downloaded from the GitHub release
# matching pkgver. CI rewrites pkgver below to match the release tag and
# drops a matching local tarball so the in-workflow build (which runs before
# that release exists) skips the network fetch.
pkgname=daily-you-bin
pkgver=3.4.3
pkgrel=1
pkgdesc="Every day is worth remembering... (mood tracking, journaling)"
arch=('x86_64')
url="https://github.com/BigWebstas/Daily_You"
license=('GPL3')
provides=('daily-you')
conflicts=('daily-you')
depends=('gtk3' 'sqlite')
source=("daily_you.desktop"
        "logo.svg"
        "https://github.com/BigWebstas/Daily_You/releases/download/v$pkgver/DailyYou-$pkgver-linux-x86_64-bundle.tar.gz")
sha256sums=('5e65fec1284bddbf8b905d5adfc6975e0936429bc416fa86f8d9244ef2148934'
            '04b9e4925d53e37da78a5cc53945c709f45c7615e232fd67be59efecf236d403'
            'SKIP')

package() {
  install -d "$pkgdir/usr/lib/daily_you"
  cp -r "$srcdir/bundle/"* "$pkgdir/usr/lib/daily_you/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/daily_you/daily_you "$pkgdir/usr/bin/daily_you"

  install -Dm644 "$srcdir/daily_you.desktop" "$pkgdir/usr/share/applications/daily_you.desktop"
  install -Dm644 "$srcdir/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/daily_you.svg"
}
