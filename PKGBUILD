_pkgname=obozrenie
pkgname=$_pkgname-git
pkgver=r45.f90c656
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
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  python setup.py install --root="${pkgdir}" --optimize='1'
  install -Dm755 obozrenie-gtk ${pkgdir}/usr/bin/obozrenie-gtk
}
