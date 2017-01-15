# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-addon-screensaver-apple-aerial
_pkgname=screensaver.atv4
_commit=62806cd4ffe7aee4d91a988151cf96443704292d
pkgver=1.3.3
pkgrel=1
pkgdesc="The Apple TV4 aerial screensaver for kodi"
arch=('any')
url='https://github.com/enen92/screensaver.atv4'
license=('GPL')
depends=('kodi')
makedepends=('git')
source=("$pkgname-$pkgver.zip::https://codeload.github.com/enen92/screensaver.atv4/zip/$_commit")
sha256sums=('44f57dfe2816064054327fea84666edac8d8819fe7af010dffa5b1bcd993dffe')
install=readme.install

package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
  cp -a "$srcdir/$_pkgname-$_commit" "$pkgdir/usr/share/kodi/addons/$_pkgname"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/README.md"
  mv "$pkgdir/usr/share/kodi/addons/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
