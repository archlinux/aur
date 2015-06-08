# Maintainer: Jelle van der Waa
pkgname=bandit-git
pkgver=0.10.1.8.g18285c1
pkgrel=1
pkgdesc="Bandit is a security linter for Python source code, utilizing the ast module from the Python standard library."
license=("APL")
url="https://wiki.openstack.org/wiki/Security/Projects/Bandit"
depends=('python2' 'python2-yaml')
makedepends=('python2-setuptools' 'python2-pip' 'git')
arch=('any')
options=(!emptydirs)
source=("git://git.openstack.org/stackforge/bandit")
md5sums=('SKIP')

pkgver() {
  cd 'bandit'
  git describe | sed 's/-/./g'
}

build() {
  cd 'bandit'
  python2 setup.py build
}

package() {
  cd 'bandit'
  python2 setup.py install --optimize=1 --root=${pkgdir}


  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # FIXME: setup.cfg
  install -d $pkgdir/etc/bandit
  mv $pkgdir/usr/etc/bandit/bandit.yaml $pkgdir/etc/bandit/
  rm -rf $pkgdir/usr/etc
}

check(){
  cd 'bandit'
  # Requires python2-testtools
  #python2 setup.py test
}
