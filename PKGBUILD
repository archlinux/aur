# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-addon-screensaver.evolve.aerial
pkgver=1.0.10
_commit=dc0756dbf1cfe0f1c24f9ec3756b5b37b87ba2b0
_short="screensaver.evolve.aerial"
pkgrel=1
pkgdesc="Apple TV4 Aerial and Underwater Screensavers for Kodi"
arch=('any')
url='https://github.com/EvolveEcosystem/screensaver.evolve.aerial'
license=('GPL')
depends=('kodi' 'python2-urllib3')
source=("${pkgname/kodi-addon-/}-$pkgver.zip::https://github.com/EvolveEcosystem/screensaver.evolve.aerial/archive/$_commit.zip"
)
install=readme.install
sha256sums=('62f611c287b176864d2beecce4acab9820a8a0e9902cb1e3218806655da0de00')
package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  install -dm755 "$pkgdir/usr/share/licenses/$_short"
  cp -a "$srcdir/$_short-$_commit" "$pkgdir/usr/share/kodi/addons/$_short"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_short/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_short/.gitignore"
  rm -f "$pkgdir/usr/share/kodi/addons/$_short/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_short/README.md"
  mv "$pkgdir/usr/share/kodi/addons/$_short/LICENSE" "$pkgdir/usr/share/licenses/$_short"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
