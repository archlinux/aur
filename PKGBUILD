# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: burntcookie90 <aur at vishnurajeevan dot com>
_gitname=i3lock-fancy
pkgname=i3lock-fancy-git
pkgver=r78.8e6f9f4
pkgrel=1
pkgdesc="i3lock-color script: blurs background, adds lock icon and text, offers dark/light background detection."
arch=('i686' 'x86_64')
url="https://github.com/meskarune/i3lock-fancy"
license=('MIT')
depends=('coreutils' 'awk' 'bash' 'util-linux' 'imagemagick' 'i3lock' 'scrot')
makedepends=('git')
provides=("i3lock-fancy")
source=("git+https://github.com/meskarune/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    patch -N "${srcdir}"/"${_gitname}"/lock ../package.patch
}
package() {
    cd "${srcdir}"/"$_gitname"
    install -Dm755 lock "${pkgdir}"/usr/bin/i3lock-fancy
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_gitname}"/LICENSE
    install -Dm644 lock.png "${pkgdir}"/usr/share/"${_gitname}"/lock.png
    install -Dm644 lockdark.png "${pkgdir}"/usr/share/"${_gitname}"/lockdark.png
}
