# Maintainer: S-Sigdel <sakshyamsigdel1@gmail.com>
pkgname=vimhjkl
pkgver=0.6.0
pkgrel=2
pkgdesc="A terminal trainer that drills advanced Vim techniques in real vim/nvim and grades your keystrokes"
arch=('any')
url="https://github.com/S-Sigdel/vimhjkl"
license=('MIT')
depends=('python')
makedepends=('uv' 'python-installer')
optdepends=('neovim: preferred editor for drills'
            'vim: alternative editor for drills')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ead3eba2e8349d33dd2231fa954f4f82c8d150606db8f88958c823874ffac46')

# Pin every interpreter reference to the system python: a bare `python` uses
# whatever is first in PATH, so building from a shell with a project venv
# active (e.g. yay run inside a checkout) found a python without `installer`
# and package() died.
build() {
  cd "$pkgname-$pkgver"
  export UV_PYTHON_DOWNLOADS=never
  uv build --wheel --python /usr/bin/python
}

package() {
  cd "$pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}
