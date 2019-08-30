# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=trackless-git
pkgbase=trackless
pkgver=0
pkgrel=1
pkgdesc='Changes your mac address of ALL interfaces so your privacy can be enhanced.'
url='https://github.com/Baitinq/trackless.git'
arch=('any')
license=('GPL')
depends=('macchanger' 'bash')
makedepends=('git')
provides=('trackless')

# include config.h and any patches you want to have applied here
source=("git://github.com/$author/$pkgbase.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgbase"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$pkgbase"
  install -Dm755 trackless "${pkgdir}/usr/bin/$pkgbase"
  chmod +x "$pkgdir/usr/bin/$pkgbase"
  install -Dm 644 trackless@.service \
    "$pkgdir/etc/systemd/system/trackless@.service"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgbase"
  chmod -R 777 "$pkgdir/usr/share/$pkgbase"
}
