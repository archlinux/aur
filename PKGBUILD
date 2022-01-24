# Maintainer: Anthony Wang <ta180m@pm.me>

_pkgname=opencontest-server
pkgname=opencontest-server-git
pkgver=v2.5.3_2_ge2c3b5f
pkgrel=2
pkgdesc="An OpenContest server written in Python"
arch=(any)
url="https://github.com/LadueCS/OpenContest-Server"
license=('AGPL')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'firejail')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed s/-/_/g
}

build() {
  cd "$srcdir/$_pkgname"

  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "$srcdir/$_pkgname"

  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1

  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
