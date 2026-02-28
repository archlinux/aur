pkgname=python-ssh-over-nat
proj_name=SSH-over-NAT
pkgver=1.0.0
pkgrel=1
pkgdesc="SSH-over-NAT tool using NAT-traversal techniques"
arch=('any')
repoaddr=https://github.com/typsoon/SSH-over-NAT
url="$repoaddr"
license=('MIT')
depends=('python' 'python-requests' 'python-psutil' 'python-pydantic' 'python-platformdirs' 'python-doit')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-wheel' 'git' 'python-pip')
source=("$proj_name::git+$repoaddr.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$proj_name" || return 1
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/$proj_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$proj_name"
  python -m pip install --root-user-action=ignore --root="$pkgdir" --no-deps --ignore-installed dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
