# Maintainer: Rodrigo González López <rodrigosloop AT gmail DOT com>
# Maintainer: Zachary Michaels <mikezackles AT gmail DOT com>
# Contributor: Felix Kauselmann <licorn AT gmail DOT com>

sha1=$(curl "https://chromium.googlesource.com/chromium/buildtools/+/master/linux64/gn.sha1?format=TEXT" | base64 --decode)
pkgname='gn-bin'
pkgdesc="Prebuilt binary for GN (Generate Ninja), Chromium's meta-build system"
pkgver=r456551
pkgrel=1
arch=('x86_64')
conflicts=('gn-git')
provides=('gn')
url='https://chromium.googlesource.com/chromium/src/tools/gn/'
source=(
  "https://storage.googleapis.com/chromium-gn/$sha1"
)
noextract=("$sha1")
sha1sums=("$sha1")

pkgver () {
  chmod +x $srcdir/$sha1
  printf "r$($srcdir/$sha1 --version)"
}

package () {
  install -Dm755 "$srcdir/$sha1" "$pkgdir/usr/bin/gn"
}
