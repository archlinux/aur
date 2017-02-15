# Maintainer: archlinux.info:tdy

pkgbase=python-git-remote-dropbox
pkgname=(python-git-remote-dropbox python2-git-remote-dropbox)
pkgver=0.2.3
pkgrel=1
pkgdesc="Use a Dropbox (shared) folder as a true Git remote"
arch=(any)
url=https://github.com/anishathalye/git-remote-dropbox
license=(MIT)
makedepends=(python-setuptools python2-setuptools)
source=(https://github.com/anishathalye/git-remote-dropbox/archive/v$pkgver.tar.gz)
sha256sums=(f72a75fb46a62055e9b71d7298693d6bc96653bbac484e0ff4f2f80ad16719f9)

prepare() {
  cp -a git-remote-dropbox-$pkgver{,-py2}
}

build() {
  cd git-remote-dropbox-$pkgver
  python setup.py build

  cd ../git-remote-dropbox-$pkgver-py2
  python2 setup.py build
}

package_python-git-remote-dropbox() {
  depends=(python-dropbox git dropbox)
  conflicts=(python2-git-remote-dropbox)

  cd git-remote-dropbox-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install LICENSE.rst -m 644 -Dt "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python2-git-remote-dropbox() {
  depends=(python2-dropbox git dropbox)
  conflicts=(python-git-remote-dropbox)

  cd git-remote-dropbox-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install LICENSE.rst -m 644 -Dt "$pkgdir"/usr/share/licenses/$pkgname/
}
