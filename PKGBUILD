# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: dustball

pkgname=oblogout-fork-git
pkgver=20130106
pkgrel=4
pkgdesc="GTK/Cairo based logout box styled for Crunchbang"
arch=('any')
url='https://github.com/Cloudef/oblogout-fork'
license=('GPL2')
depends=('pygtk'
         'python'
         'python2-pillow'
         'python2-distutils-extra'
         'python2-dbus')
optdepends=('upower')
makedepends=('git')
backup=(etc/oblogout.conf)  
conflicts=('openboxlogout-gnome' 'oblogout')
install=oblogout.install
source=("${pkgname%-git}::git+${url}"
        'oblogout.conf'
        'switch-user.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "${pkgname%-git}"
  patch -p1 < "$srcdir/switch-user.patch"
}

package() {
  cd "${pkgname%-git}"
  python2 setup.py install --root="${pkgdir}/"
  install -m644 "${srcdir}/oblogout.conf" "${pkgdir}/etc/"
}
# vim:set ts=2 sw=2 et: