# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
# Contributor: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
pkgname=yumbootstrap-git
_pkgname=yumbootstrap
pkgver=87.2733c23
pkgrel=1
pkgdesc="Tool for installing Yum-based distributions (Red Hat, CentOS, Fedora) in a chroot directory"
arch=('any')
url="http://dozzie.jarowit.net/trac/wiki/yumbootstrap"
license=('GPL')
groups=()
depends=('python2' 'yum' 'python2-rpm')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(${_pkgname}::git+https://github.com/dozzie/yumbootstrap.git)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  sed -i 's/python/python2/' bin/yumbootstrap distros/scripts/*.py

  mkdir -p $pkgdir/etc/yumbootstrap/suites
  cp -R distros/* $pkgdir/etc/yumbootstrap/suites/

  mkdir -p $pkgdir/usr/bin
  cp bin/yumbootstrap $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
