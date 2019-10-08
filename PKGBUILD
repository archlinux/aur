# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Georg Vogetseder <georg.vogetseder@gmail.com>

pkgname=hamster-time-tracker2
pkgver=2.2.2
pkgrel=3
pkgdesc="Time tracking application that helps you to keep track on how much time you have spent during the day on activities you choose to track"
arch=('any')
url="https://github.com/projecthamster/hamster"
license=('GPL')
depends=('python-dbus' 'python-cairo' 'python-gobject'  'python-xdg' 'desktop-file-utils')
makedepends=('intltool' 'gnome-doc-utils')
source=(https://github.com/projecthamster/hamster/archive/v$pkgver.tar.gz)

prepare() {
  cd hamster-$pkgver

}

build() {
  cd hamster-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd hamster-$pkgver
  ./waf install --destdir=$pkgdir
  install -dm755 "$pkgdir/usr/lib/python3.7/site-packages"
  mv $pkgdir/usr/lib/python2.7/site-packages/hamster $pkgdir/usr/lib/python3.7/site-packages/


  # Move bash completion and GConf schema to its correct place
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/etc/bash_completion.d/hamster.bash" "$pkgdir/usr/share/bash-completion/completions/hamster"
  mv "$pkgdir/etc/gconf" "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
}
md5sums=('980ddf4ceef842da255bda37914f971d')
