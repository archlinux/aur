# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: Daniel Wallace <daniel.wallace at gatech dot edu>

_pkgname_base=irssi-libnotify
pkgname=$_pkgname_base-git

pkgver=r38.8f8f9e1
pkgrel=1
pkgdesc="libnotify plugin for irssi"
arch=("any")
url="https://code.google.com/p/irssi-libnotify/"
license=('GPL')
depends=('irssi' 'libnotify>=0.7' 'python2-gobject' 'perl-html-parser')
makedepends=('git')

source=("$pkgname"::'git+https://code.google.com/p/irssi-libnotify/'
        'irssi-libnotify-git.install')

install='irssi-libnotify-git.install'

md5sums=('SKIP'
         '274448951b53b5a492a80e794e61b9fd')

pkgver() {
  cd "$srcdir/$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  sed -i 's:python:&2:' notify-listener.py
  sed -i 's?~/bin/irssi-notifier.sh?/usr/bin/irssi-notifier?' notify.pl
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 irssi-notifier.sh "$pkgdir/usr/bin/irssi-notifier"
  install -Dm755 notify-listener.py "$pkgdir/usr/bin/notify-listener"
  install -Dm644 notify.pl "$pkgdir/usr/share/irssi/scripts/notify.pl"
}
