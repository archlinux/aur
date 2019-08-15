#Maintainer: Bruna Bazaluk M. V. <bazaluk at riseup dot net>
pkgname=kworkflow-git
_gitname=kworkflow
_lpkg="${_gitname,,}"
pkgver=0.7
pkgrel=2
pkgdesc="Scripts that help setting up infra for kernel development."
arch=('x86_64')
url="https://github.com/rodrigosiqueira/kworkflow"
source=("git+https://github.com/rodrigosiqueira/kworkflow.git")
license=('GPL2')
depends=("libguestfs"
		 "qemu"
		 "ansible"
		 "git"
		)
provides=("${_lpkg}")
conflicts=("${_lpkg}")
md5sums=('SKIP')
prepare() {
  cd "$_gitname"
  git checkout master
  git pull
}
build() {
  cd "$_gitname"
  chmod +x setup.sh
  ./setup.sh -i
}
package() {
  cd "$_gitname"
  mkdir -p "$pkgdir$HOME/.kworkflow"
  cp -r * "$pkgdir$HOME/.kworkflow/"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "$HOME/.kw/kw" "$pkgdir/usr/bin/kworkflow"
}
install="kw.install"
