pkgname=douane-dialog-git
pkgver=1
pkgrel=3
pkgdesc="Douane Firewall Kernel GTK GUI"
arch=('i686' 'x86_64')
url="http://douaneapp.com/"
license=('GPL2')
depends=('')
makedepends=('git'
             'boost'
             'log4cxx'
             'gtkmm3'
             'dbus-c++')
source=('git+https://github.com/Douane/douane-dialog.git'
        'git+https://github.com/Douane/douane-dbus.git')
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$srcdir/douane-dialog"
  git submodule init
  git config submodule.douane-dbus.url $srcdir/douane-dbus
  git submodule update
}

build() {
  cd "$srcdir/douane-dialog"

  msg2 "Starting make..."
  make
}

package() {
  # Install
  cd "$srcdir/douane-dialog"
  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

}
