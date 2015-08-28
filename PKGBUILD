pkgname=obozrenie-git
pkgver=0.1
pkgrel=1
pkgdesc='Simple and easy to use game server browser'
arch=('any')
url='http://github.com/obozrenie'
license=('GPL3')
depends=('desktop-file-utils' 'glib-networking' 'gvfs' 'hicolor-icon-theme'
         'python-gobject' 'python-xdg' 'python-pytoml' 'qstat')
makedepends=('git' 'python-setuptools')
optdepends=('python-pygeoip: for geolocation support')
provides=('obozrenie')
conflicts=('obozrenie')
install='obozrenie.install'
source=('git+https://github.com/obozrenie/obozrenie.git')
sha256sums=('SKIP')

pkgver() {
  cd obozrenie

  printf "%s" "$(git describe | sed 's/v//; s/-/.r/; s/-g/./')"
}

package() {
  cd obozrenie

  python setup.py install --root="${pkgdir}" --optimize='1'
  install -Dm755 obozrenie-gtk ${pkgdir}/usr/bin/obozrenie-gtk
}
