# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=python2-support
_pkgname=python-support
_python=python2
pkgver=1.0.15
pkgrel=2
pkgdesc="automated rebuilding support for python modules"
arch=('any')
url="http://packages.debian.org/sid/python-support"
license=('LGPL2.1')
depends=('python2' 'dpkg')
conflicts=()
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver.tar.gz)
md5sums=('fa98675199468943db49deab6f147ebd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  for i in {update-python-modules,movemodules,parseversions}; do
    sed -i -e '1s|/usr/bin/python$|/usr/bin/python2|' $i
  done
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  install update-python-modules $pkgdir/usr/bin/
  install debhelper/dh_pysupport $pkgdir/usr/bin/

  mkdir -p $pkgdir/usr/share/python-support/private
  cp -a python-support.private $pkgdir/usr/share/python-support/
  cp -a movemodules parseversions $pkgdir/usr/share/python-support/private/
  cp -a *.py $pkgdir/usr/share/python-support/private/

  mkdir -p $pkgdir/usr/share/debhelper/autoscripts/
  cp -a debhelper/*-python-support $pkgdir/usr/share/debhelper/autoscripts/

  mkdir -p $pkgdir/usr/share/python/runtime.d/
  cp -a runtime/* $pkgdir/usr/share/python/runtime.d/
}

# vim:set ts=2 sw=2 et:
