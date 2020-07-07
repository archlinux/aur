# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-chtheme
pkgver=0.3.1
pkgrel=10
pkgdesc="A little program to change your gtk+ 2.0 theme"
arch=('x86_64')
license=('GPL')
url="http://plasmasturm.org/programs/gtk-chtheme/"
depends=('gtk2')
source=(http://plasmasturm.org/programs/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f688053bf26dd6c4f1cd0bf2ee33de2a')

build() {
  cd $pkgname-$pkgver

  # Fix xdg compliancy
  sed -i 's|-DGTK.*||' Makefile
  sed -i 's|theme_list(g_.*|&\n\tread_theme_list(g_strconcat(g_get_user_data_dir(), "/themes", NULL));|' main.c

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
