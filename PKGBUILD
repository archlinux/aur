# Contributor: Thomas Bächler <thomas@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=joe-hg
pkgver=4.6.r1077.8078f28eb18c
pkgrel=2
pkgdesc="Joe's own editor - hg checkout"
arch=('x86_64')
url="https://joe-editor.sourceforge.io/"
license=('GPL')
depends=('ncurses')
conflicts=('joe')
provides=('joe')
optdepends=('gpm: console mouse support')
makedepends=('mercurial')
backup=('etc/joe/ftyperc' 'etc/joe/jicerc.ru' 'etc/joe/jmacsrc'
        'etc/joe/joerc' 'etc/joe/jpicorc' 'etc/joe/jstarrc' 'etc/joe/rjoerc')
source=("joe::hg+http://hg.code.sf.net/p/joe-editor/mercurial")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-hg}
  _appver=$(awk -F", " '/AC_INIT/ {print $2}' configure.ac|tr -d \))
  printf "%s.r%s.%s" "${_appver}" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd ${pkgname%-hg}
  ./autojoe
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname%-hg}

  make DESTDIR="${pkgdir}/" install
}
