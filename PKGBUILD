# Maintainer: jstoik1 <joshstoik at gmail dot com>
pkgname=gmvault-git
pkgver=20150420
pkgrel=3
pkgdesc="Backup and restore your gmail account at will."
arch=(any)
url="http://gmvault.org"
license=('GPL')
depends=('python2' 'python2-logbook' 'python2-gdata' 'python2-imapclient' 'python2-chardet')
makedepends=('setuptools' 'git')
conflicts=('gmvault')
provides=('gmvault')
source=('gmvault::git+git://github.com/gaubert/gmvault.git' 'use-python2.patch')
sha512sums=('SKIP' '05ef986e64bccefd9f98f42709b5c9b2b6ede8d82e5a081447e506eaea7af3dd0ffce27335ba39374ef812883e5d2d14ad429c729cba7664559010d37420006d')

_gitname='gmvault'

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  patch -p1 < ../use-python2.patch

  msg 'Starting build...'
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et: