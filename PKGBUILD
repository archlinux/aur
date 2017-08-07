# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=git-buildpackage
pkgver=0.8.18
pkgrel=1
pkgdesc="Tools from Debian to integrate the package build system with Git"
arch=(any)
url="https://honk.sigxcpu.org/piki/projects/git-buildpackage/"
license=('GPL')
depends=('git'
         'man-db'
         'python2'
         'python2-dateutil'
	 'python2-six'
         'rpm-org')
makedepends=('python2-distribute'
             'python2-coverage'
	     'python2-flake8'
	     'python2-mock'
	     'python2-nose')
backup=('etc/git-buildpackage/gbp.conf')
source=("git+https://github.com/agx/git-buildpackage.git#tag=debian/$pkgver")
sha256sums=('SKIP')

build() {
  cd git-buildpackage
  python2 setup.py build
}


build() {
  cd git-buildpackage
  python2 setup.py check
}

package() {
  cd git-buildpackage/
  python2 setup.py install --root="$pkgdir" --prefix=/usr -O1
  install -d "$pkgdir/etc/git-buildpackage/"
  install "gbp.conf" "$pkgdir/etc/git-buildpackage/gbp.conf"
}
