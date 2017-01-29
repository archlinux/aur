# Maintainer: archlinux.info:tdy

pkgbase=python-git-remote-dropbox
pkgname=(python-git-remote-dropbox python2-git-remote-dropbox)
pkgver=0.2.2
pkgrel=1
pkgdesc="Use a Dropbox (shared) folder as a true Git remote"
arch=(any)
url=https://github.com/anishathalye/git-remote-dropbox
license=(MIT)
makedepends=(python-setuptools python2-setuptools)
source=(https://github.com/anishathalye/git-remote-dropbox/archive/v$pkgver.tar.gz)
sha256sums=(f897ac6c0364cb56c9b35baf837cdd1a8e59241a8be5f2083502d97438873b1e)

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

  cd git-remote-dropbox-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-git-remote-dropbox() {
  depends=(python2-dropbox git dropbox)

  cd git-remote-dropbox-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
