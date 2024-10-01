# Contributor: Swift Geek

pkgname=authprogs-git
pkgver=a
pkgrel=1
pkgdesc="SSH Command Authenticator"
arch=('any')
url="https://github.com/daethnir/authprogs"
license=('GPL-2.0-or-later')
depends=('python' 'python-yaml')
makedepends=('git' 'ruby-ronn-ng' 'python-markdown' 'python-setuptools'
             'python-build' 'python-installer' 'python-wheel')
checkdepends=('openssh')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m unittest discover
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
