# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Maintainer: Khorne <khorne at khorne dot me>

pkgname=legit-git
pkgver=0.r468.7345d70
pkgrel=1
pkgdesc="Sexy Git CLI, Inspired by GitHub for Mac™."
arch=('any')
url="https://github.com/kennethreitz/legit"
license=('BSD')
depends=('python' 'python-gitpython' 'python-clint' 'python-gitdb' 'python-args' 'python-crayons')
makedepends=('git')
source=("$pkgname::git+https://github.com/kennethreitz/legit.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -ni 's/GitPython==2.1.8/GitPython>=2.1.8/' "$srcdir/$pkgname/reqs.txt"
}

package() {
  cd "$srcdir/$pkgname"

  python setup.py install --root=$pkgdir
  install -Dm644 LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 sts=2 et:
