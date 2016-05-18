# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: burntcookie90 <aur at vishnurajeevan dot com>
_gitname=i3lock-fancy
_branch=dualmonitors
pkgname=i3lock-fancy-dualmonitors-git
pkgver=r81.1c32f7e
pkgrel=1
pkgdesc="i3lock-color script: blurs background, adds lock icon and text with multihead support."
arch=('i686' 'x86_64')
url="https://github.com/meskarune/i3lock-fancy"
license=('MIT')
depends=('coreutils' 'awk' 'bash' 'util-linux' 'imagemagick' 'i3lock' 'scrot')
makedepends=('git')
provides=("i3lock-fancy")
conflicts=("i3lock-fancy-git")
source=("git+https://github.com/meskarune/$_gitname.git#branch=$_branch" "package.patch")
md5sums=('SKIP'
         '50359f68f4c09e08b39d23cb8ea401f2')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    patch -N "${srcdir}"/"${_gitname}"/lock "${srcdir}"/package.patch
}
package() {
    cd "${srcdir}"/"$_gitname"
    install -Dm755 lock "${pkgdir}"/usr/bin/i3lock-fancy
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_gitname}"/LICENSE
    install -Dm644 lock.png "${pkgdir}"/usr/share/"${_gitname}"/lock.png
}
