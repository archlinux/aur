pkgname='webvirt-api-git'
pkgver=1.0.0.r6.gbf93d0b
pkgrel=1
pkgdesc='PAM-athenticated HTTP proxy to webvirtd'
license=('Apache')
url='https://github.com/kevr/webvirt_api'

arch=('any')
depends=(
  'webvirtd'
  'uwsgi'
  'uwsgi-plugin-python'
  'python-poetry'
  'python-virtualenv'
)
provides=('webvirt-api')
conflicts=('webvirt-api')

source=("${pkgname}::git+https://github.com/kevr/webvirt_api")
sha256sums=('SKIP')

install='webvirt-api-git.install'

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  find "$pkgname" -type f -exec install -vDm644 {} "$pkgdir"/usr/lib/{} \;
  mv "$pkgdir"/usr/lib/"${pkgname}" "$pkgdir"/usr/lib/webvirt_api
  install -Dm644 "$pkgname"/res/webvirt_api.ini "$pkgdir"/etc/uwsgi/webvirt_api.ini
}
