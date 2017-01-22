# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Georg Grabler <ggrabler@gmail.com>

pkgname=perlpanel
pkgver=20080729
pkgrel=6
pkgdesc="The ideal accompaniment to a light-weight Window Manager such as OpenBox, or a desktop-drawing program like iDesk."
arch=('any')
url="http://savannah.nongnu.org/projects/perlpanel"
license=('GPL')
depends=('glade-perl' 'gnome-vfs-perl' 'perl-date-manip' 'perl-gnome2-wnck' 'perl-locale-gettext' 'perl-xml-parser' 'perl-xml-simple' 'hicolor-icon-theme')
source=(http://archlinux-stuff.googlecode.com/files/PerlPanel-$pkgver.tar.gz
	arch.patch)
md5sums=('8c7b76c4a5447ba4deef34b29bf883b7'
         'c224817ecd0fa7372b3326a3f8196c3e')

prepare() {
  cd "$srcdir"/PerlPanel
  chmod -R u+w *
  sed -i 's|PREFIX=/usr/local|PREFIX=/usr|' Makefile
  patch -p1 <../arch.patch
}

build() {
  cd "$srcdir"/PerlPanel
  make
}

package() {
  cd "$srcdir"/PerlPanel
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -exec rm '{}' \;
  find "$pkgdir" -name 'perllocal.pod' -exec rm '{}' \;
  find "$pkgdir" -depth -type d -empty -exec rmdir '{}' \;
  find "$pkgdir" -depth -type d -name CVS -exec rm -rf {} \;
}
