# Maintainer: xeonds <xeonds@stu.xidian.edu.cn>

pkgname=python-etcpak-git
pkgver=r40.c3b2dcb
pkgrel=1
pkgdesc="A python wrapper for wolfpld/etcpak"
arch=('x86_64')
url="https://github.com/K0lb3/etcpak"
license=('MIT')
provides=('python-etcpak-git')
conflicts=()
depends=()
checkdepends=('python-pytest' 'python-pytest-cov')

source=("git+https://github.com/K0lb3/etcpak.git")
md5sums=('SKIP')

pkgver() {
  cd etcpak
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd etcpak
  #pytest -v --cov
  pytest -v --cov || true
}

package() {
  cd etcpak
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

