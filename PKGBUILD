# Maintainer: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr from the AUR

pkgname=emacs-lucid
pkgver=25.1
pkgrel=4
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'm17n-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls' 'libxrandr' 'libxinerama')
conflicts=('emacs')
provides=('emacs')
validpgpkeys=('B29426DEFB07724C3C35E5D36592E9A3A0B0F199'
              '28D3BED851FDF3AB57FEF93C233587A47C207910')
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz{,.sig})
md5sums=('4f3d42fb22823a659e16bfa89078a74c'
	     'SKIP')

build() {
  cd "$srcdir"/emacs-$pkgver
  ./configure \
      --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --localstatedir=/var \
      --with-x-toolkit=lucid --with-xft --without-gconf --without-gsettings \
      --with-gameuser=:games --program-transform-name='s/^ctags$/ctags.emacs/'
  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;

  chmod 775 "$pkgdir"/var/games
}
