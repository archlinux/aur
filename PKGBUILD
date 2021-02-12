# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-addon-screensaver-apple-aerial
_pkgname=screensaver.atv4
pkgver=1.5.1
pkgrel=2
pkgdesc="The Apple TV4 aerial screensaver for kodi"
arch=('any')
url='https://github.com/enen92/screensaver.atv4'
license=('GPL')
#depends=('kodi>19.0')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/enen92/$_pkgname/archive/$pkgver.tar.gz"
0001-update-url-to-movies.patch
0002-Removed-duplicates-videos.patch
0003-Initial-python3-compatibility.patch
0004-Minor-fixes.patch
0005-update-for-py3-and-kodi-19-compatibility.patch
)
sha256sums=('e76c61862651dfecd7977b66b22b45da5319a0ff22059e49b7b569e14b2aa213'
            '80ead57a9a07cef3adfc0bded8e3cf5e982c4515f435d95d53de2ae5c178ea77'
            '732e3270ad048311dd75377e9e23072ea721215573b976307e74dcdfd32e2831'
            '4f8131b5ba012db1dd2f3714f4a193b16d505f2d4ebfe6f70e0ee0db0f690677'
            '09056c5a220b6bc577710c0ce051ec563d52089afc0e85bcc3ec7b9927b27f62'
            '078cbefcd4bd1aff9225e4e4388e97d3bdc03ef6255004d6d28802f9e8a175ca')
install=readme.install

prepare() {
  cd "$_pkgname-$pkgver"
  for i in ../0*.patch; do
    patch -Np1 -i $i
  done
}

package() {
  install -dm755 "$pkgdir/usr/share/kodi/addons"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
  cp -a "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/share/kodi/addons/$_pkgname"

  # clean up
  rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/.gitignore"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
  rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/README.md"
  mv "$pkgdir/usr/share/kodi/addons/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"

  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}

# vim:set ts=2 sw=2 et:
