pkgname=pflask-git
_gitname=pflask
pkgver=r274.30d3b94
pkgrel=1
pkgdesc="Lightweight process containers for Linux"
arch=('i686' 'x86_64')
url="https://github.com/ghedo/pflask"
license=('custom')
provides=('pflask')
conflicts=('pflask')
makedepends=('git')
source=('git://github.com/ghedo/pflask.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
   ./bootstrap.py
   ./waf configure
   ./waf build
}

package() {
  cd "$pkgdir"
  install -dm0755 usr/bin/
  install -m0755 "$srcdir"/"$_gitname"/build/pflask usr/bin/
  install -dm0755 usr/share/zsh/site-functions
  install -m0644 "$srcdir"/"$_gitname"/etc/pflask.zsh-completion usr/share/zsh/site-functions/_pflask
  install -Dm0644 "$srcdir"/"$_gitname"/COPYING usr/share/licenses/pflask/LICENSE
  install -Dm0644 "$srcdir"/"$_gitname"/README.rst usr/share/doc/pflask/README.rst
}
