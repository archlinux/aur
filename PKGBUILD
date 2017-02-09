_username=vorot93
_reponame=obozrenie
pkgname=obozrenie-git
pkgver=r252.a113ab8
pkgrel=1
pkgdesc='Simple and easy to use game server browser'
arch=('any')
url='https://github.com/vorot93/obozrenie'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'gvfs' 'python-gobject' 'python-pytoml' 'python-xdg' 'gtk3' 'python-beautifulsoup4' 'python-xmltodict' 'qstat')
makedepends=('git' 'python-babel' 'python-setuptools')
optdepends=('python-pygeoip: for geolocation support' 'geoip-database: for geolocation support')
install='obozrenie.install'
source=("git+https://github.com/$_username/$_reponame.git")
sha512sums=('SKIP')

pkgver() {
  cd $_reponame
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_reponame

  python setup.py install --root="${pkgdir}" --optimize='1'
  python setup.py compile_catalog -D io.obozrenie -d locale

  SRCPO=$(find | grep io.obozrenie.po)
  rm $SRCPO
  chmod -R 755 locale

  install -Dm755 obozrenie-gtk ${pkgdir}/usr/bin/obozrenie-gtk
  cp -r locale ${pkgdir}/usr/share/locale/
}
