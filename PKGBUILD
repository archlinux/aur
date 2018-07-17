pkgname=sibt
pkgver=0.2.1
pkgrel=1
pkgdesc="A configurable command line interface to existing backup tools"
arch=('any')
url='https://pid0.github.io/sibt-doc/index.html'
license=('GPL3')
depends=(python bash openssh util-linux rsync rdiff-backup tar lzop duplicity)
makedepends=()
checkdepends=(python-pytest python-paramiko python2-fuse phodav) #python-paver)
optdepends=('sshfs: For auto-mounting via sftp'
            'cronie: For using anacron as a scheduler')

source=(git+https://github.com/pid0/sibt.git)
sha256sums=('SKIP')

check() {
  cd "$srcdir"/"$pkgname"-"$pkgver"

  #TODO paver does not return non-zero if tests fail
  paver acceptance_test
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"

  paver install --root="$pkgdir" --prefix=/usr -O1
  #python setup.py install --root="$pkgdir" --prefix=/usr -O1
}
