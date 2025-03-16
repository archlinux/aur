# Maintainer: xeonds <xeonds@stu.xidian.edu.cn>

pkgname=python-etcpak-git
pkgver=r40.3def800
pkgrel=1
pkgdesc="A python wrapper for wolfpld/etcpak"
arch=('x86_64')
url="https://github.com/K0lb3/etcpak"
license=('MIT')
provides=('python-etcpak-git')
conflicts=()
depends=('python-archspec' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')

source=("git+https://github.com/K0lb3/etcpak.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/etcpak"
  git submodule update --init --recursive  # Initialize and update submodules
}

pkgver() {
  cd etcpak
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd etcpak
  pytest -v --cov || true
}

package() {
  cd etcpak
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

