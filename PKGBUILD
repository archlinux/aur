# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander
pkgver=1.1.0
pkgrel=1
pkgdesc='Razer device manager for Linux'
arch=('any')
url='https://github.com/gabmus/razercommander'
license=('GPL3')
depends=('python-razer' 'gtk3>=3.14' 'python')
source=("razercommander-$pkgver.tar.gz::https://github.com/GabMus/razerCommander/archive/$pkgver.tar.gz" "symlink-fix.patch")
sha512sums=('c34a2303a3cda2e6133b9310ad1756b6163879e073a365487367781033b9f4afe04e7d4f3ec02315ba62a9822bae826452d28b2de521c8db1a83dc31c5f3b0da'
            'd064b0151649790a782e533517efea974757ddcfed385fce029482b0736b5716a29cc7fa7a0b3c5552d11efc39fec90868f170c57138902ba1b82b61bd1439e8')

prepare() {
  cd "$srcdir/razerCommander-$pkgver"
  patch -p1 < "$srcdir/symlink-fix.patch"
}

package() {
  cd "$srcdir/razerCommander-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/razercommander
  install -Dm644 razercommander.desktop.in $pkgdir/usr/share/applications/razercommander.desktop
  cp -r ./* $pkgdir/usr/share/razercommander/
  ln -s /usr/share/razercommander/main.py $pkgdir/usr/bin/razercommander
}
