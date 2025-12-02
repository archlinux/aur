# Maintainer: Your Name <your.email@example.com>
pkgname=taskfile-to-tasks-python-git
pkgver=1.0.0
pkgrel=3
pkgdesc="Convert Taskfile.yml to an editor tasks format, like VSCode and Zed tasks.json"
arch=('any')
url="https://github.com/H3mul/taskfile-to-tasks"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('git')
provides=('taskfile-to-tasks')
conflicts=('taskfile-to-tasks')
options=('!debug')
source=('git+https://github.com/H3mul/taskfile-to-tasks.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/taskfile-to-tasks"
  grep version pyproject.toml | head -n 1 | sed 's/version = "\(.*\)"/\1/'
}

build() {
  cd "${srcdir}/taskfile-to-tasks"
  python setup.py build
}

package() {
  cd "${srcdir}/taskfile-to-tasks"
  pip install --root="${pkgdir}" --no-deps --ignore-installed --prefix="/usr" .
}
