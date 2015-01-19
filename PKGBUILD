# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=tahoe-lafs-git
pkgver=5972.f31b684
pkgrel=1
pkgdesc="A secure, decentralized, fault-tolerant file store (git version)"
url="https://tahoe-lafs.org/"
arch=('any')
license=('GPL')
depends=('net-tools' 'python2' 'python2-zope-interface>=3.6.5' 'twisted'
         'python2-pyasn1' 'python2-crypto' 'pycryptopp' 'nevow'
         'python2-foolscap' 'python2-simplejson' 'zfec' 'python2-pyopenssl'
         'pyutil' 'python2-argparse' 'zbase32' 'python2-mock>=0.8.0'
         'python2-characteristic>=14.0' 'python2-service-identity'
         'python2-setuptools')
makedepends=('git')
provides=('tahoe-lafs')
conflicts=('tahoe-lafs')
source=('git+https://github.com/tahoe-lafs/tahoe-lafs.git'
        '0001-auto_deps-Workaround-dep-resolution-issue.patch')
sha256sums=('SKIP'
            '2f43e98fc44a3597e28fd46de9c7b06e2aeedf62dc41fe9dcd18de03266ec915')

pkgver() {
  cd "$srcdir/tahoe-lafs"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/tahoe-lafs"
  patch -p1 -i ../0001-auto_deps-Workaround-dep-resolution-issue.patch
}

build() {
  cd "$srcdir/tahoe-lafs"
  python2 setup.py build
}

check() {
  cd "$srcdir/tahoe-lafs"
  python2 setup.py test
}

package() {
  cd "$srcdir/tahoe-lafs"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
