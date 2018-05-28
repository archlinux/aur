# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgname=pyalpm
pkgname=$_pkgname-git
pkgver=0.8.2.r1.g1f95811
pkgrel=1
pkgdesc="Libalpm bindings for Python 3 (Git version)"
arch=('i686' 'x86_64')
url="https://git.archlinux.org/pyalpm.git/"
license=('GPL3')
depends=('python>=3.6' 'pacman>=5')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
makedepends=('git')
source=('git+https://projects.archlinux.org/git/pyalpm.git'
        bpo33012.patch::'https://patchwork.archlinux.org/patch/544/raw/')
sha256sums=('SKIP'
            '8006c0252733f76c2af6f69bdaed20c91d8710cb0ce96ce69650b7518c66064d')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname

  patch -Np1 -i ../bpo33012.patch
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1
}

