# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: LinuxUser <archlinux-user@gmx.com>

pkgname=kdeplasma-applets-gx-mail-notify
pkgver=0.4.4
pkgrel=1
pkgdesc="Plasmoid for checking unreaded e-mails."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=99617"
license=('GPL')
conflicts=('plasma-gx-mail-notify-plasmoid')
replaces=('plasma-gx-mail-notify-plasmoid')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
install=gxmailnotify.install
source=("http://www.kde-look.org/CONTENT/content-files/99617-gx_mail_notify-$pkgver.tar.bz2" "mail_checker.cpp.patch")
md5sums=('bc9bb6234f85abdfc630b94390c474bf'
         'afae43af219c3ddd6f3cf021cead6947')

build() {
  patch -p0 -d"$srcdir"/gx_mail_notify-$pkgver -i $srcdir/mail_checker.cpp.patch

  mkdir -p "$srcdir"/build
  cd "$srcdir"/build

  cmake -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" -DCMAKE_BUILD_TYPE=Release ../gx_mail_notify-$pkgver
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir/" install
}
