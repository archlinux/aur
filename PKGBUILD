# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Angelo "Encelo" Theodorou <encelo@gmail.com>
# Contributor: Jesús Barbero Rodríguez <chuchiperriman@gmail.com>

_pkgname=cloud-services-notifications
pkgname=cloudsn
pkgver=0.10.2
pkgrel=5
pkgdesc="E-mail (POP3, Gmail, IMAP), RSS and tweets notifier"
arch=('any')
url="https://chuchiperriman.github.io/cloud-services-notifications/"
license=('GPL3')

# See ubuntu package 'python-indicate'
#'libindicate-gtk2' 'libindicate-gtk3'
depends=('pygtk' 'python2-dbus' 'python2-gobject' 'python2-notify' 'python2-xdg')
optdepends=('python2-feedparser: RSS support'
            'python2-gnomekeyring: store passwords in gnome-keyring'
            'gstreamer0.10-python: play sounds')

source=("$pkgname-$pkgver.tar.gz::https://github.com/chuchiperriman/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('470a67a55e00bb6785bf717c58c937f8')

prepare() {
  cd "$_pkgname-$pkgver"

  # Patch for "'NoneType object has no attribute 'set_markup'"
  sed -i "s|\(indmenuItem.get_child().set_markup\)|#\1|" src/cloudsn/ui/indicators/statusicon.py
}

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}

