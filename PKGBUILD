# Maintainer: archlinux.info:tdy

pkgbase=python-git-remote-dropbox-git
pkgname=(python-git-remote-dropbox-git python2-git-remote-dropbox-git)
pkgver=r29.27cb825
pkgrel=1
pkgdesc="Use a Dropbox (shared) folder as a true Git remote"
arch=(any)
url=https://github.com/anishathalye/git-remote-dropbox
license=(MIT)
makedepends=(python-setuptools python2-setuptools git)
source=(git+https://github.com/anishathalye/git-remote-dropbox.git)
sha256sums=(SKIP)

pkgver() {
  cd git-remote-dropbox
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -a git-remote-dropbox{,-py2}
}

build() {
  cd git-remote-dropbox
  python setup.py build

  cd ../git-remote-dropbox-py2
  python2 setup.py build
}

package_python-git-remote-dropbox-git() {
  depends=(python-dropbox git dropbox)
  provides=(python-git-remote-dropbox)
  conflicts=(python-git-remote-dropbox)

  cd git-remote-dropbox
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-git-remote-dropbox-git() {
  depends=(python2-dropbox git dropbox)
  provides=(python2-git-remote-dropbox)
  conflicts=(python2-git-remote-dropbox)

  cd git-remote-dropbox-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
