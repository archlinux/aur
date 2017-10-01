# Maintainer: kso <keansum AT gmail DOT com>

pkgname=htcap-git
_pkgname=htcap
pkgver=1.0.1.r36.gdcc0078
pkgrel=2
pkgdesc="Single Page Application (SPA) crawler by intercepting AJAX calls and DOM changes"
arch=('x86_64' 'i686')
url="http://htcap.org/"
license=('GPL2')
depends=('python2'
         'phantomjs'
         'sqlmap')
optdepends=('arachni')
makedepends=('git')
install=htcap.install
source=('git+https://github.com/segment-srl/htcap')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's_#\!/usr/bin/env python_#\!/usr/bin/env python2.7_' htcap.py
}

pkgver() {
  cd "$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  # adding the r and replacing '.' with '-'.
  # eg.  v1.0.1-36-gdcc0078  becomes 
  #       1.0.1.r36.gdcc0078
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  mkdir -p "$pkgdir"/usr/share/
  mv "$_pkgname" "$pkgdir"/usr/share/
}
