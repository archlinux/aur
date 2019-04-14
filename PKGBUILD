# $Id: PKGBUILD 233049 2015-03-08 08:14:35Z $
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>
# Maintainer: andym <andrew dot myers at wanadoo dot fr>

pkgname=xfce4-quicklauncher-plugin
pkgver=1.9.4
pkgrel=11
pkgdesc="Plugin that creates little application launchers in the Xfce4 panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-quicklauncher-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4')
makedepends=('intltool')
source=(http://archive.xfce.org/src/panel-plugins/$pkgname/1.9/$pkgname-$pkgver.tar.bz2
        xfce4-quicklauncher-plugin-1.9.4-desktop-file.patch
        xfce4-quicklauncher-plugin-1.9.4-fix-missing-english-translation.patch
        xfce4-quicklauncher-plugin-1.9.4-fix-multiscreen.patch
        xfce4-quicklauncher-plugin-1.9.4-save-settings.patch
        xfce4-quicklauncher-plugin-1.9.4-xfce4-settings-manager.patch)
sha256sums=('0b253d96e3b3fb02508e1100cbf39bfb8b40e9c75da75053e6432d83dedfffdf'
            'b652819d9f4b1c1b1851e7fbd6f811c9087ca500cd8231abf7aa28072293254e'
            '3d7b41a5f4c8a7506f57f612b68b6b92cdd2d251cc7d3b7a7762bbaed60d612d'
            'f2ec190adcf1d4bef2317b29a3005ce3066b34f9cf5d6a48c045112f1c16c4c3'
            '7944d9ac739cefd37fc00abca2ed6d7c45b00ed7afd02bb8779d9a11b54d986e'
            '0c678f3128df6b3061fa409a06c2399e43031f7424a1aaa6643fa98aa02e25c7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patches from Fedora
  patch -Np0 -i "$srcdir/xfce4-quicklauncher-plugin-1.9.4-desktop-file.patch"
  patch -Np0 -i "$srcdir/xfce4-quicklauncher-plugin-1.9.4-fix-multiscreen.patch"
  patch -Np1 -i "$srcdir/xfce4-quicklauncher-plugin-1.9.4-save-settings.patch"
  patch -Np1 -i "$srcdir/xfce4-quicklauncher-plugin-1.9.4-fix-missing-english-translation.patch"
  patch -Np0 -i "$srcdir/xfce4-quicklauncher-plugin-1.9.4-xfce4-settings-manager.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
