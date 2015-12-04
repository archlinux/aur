# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.3
pkgrel=2
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/aurupbot
depends=(curl git namcap pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "s-nail: send reports using the mail command")
source=("changelog.patch" "$url/archive/v$pkgver.tar.gz")
sha256sums=("4ef2ca3ab311ed82040cf6ad08a1b66fe626f0c42da3ce722443f93df6fd642d"
            "de2e094aed6db512b2249d7d06c3a5283addda645feed026d05920f1eaffdaae")

prepare() {
  cd "${srcdir}/$pkgname-$pkgver/"
  patch -Np1 -i "../changelog.patch"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
  mkdir -p "$pkgdir/etc"
  install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
