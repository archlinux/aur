# Maintainer: Brandon Mittman <brandonmittman at gmail dot com>
# Contributor: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: burntcookie90 <aur at vishnurajeevan dot com>
_gitname=swaylock-fancy
pkgname=swaylock-fancy-git
pkgver=r226.0b93740
pkgrel=1
pkgdesc="Blurs and pixelates background, adds lock icon and text, for sway."
arch=('any')
url="https://github.com/Big-B/swaylock-fancy"
license=('MIT')
depends=('coreutils' 'awk' 'grep' 'sed' 'bash' 'util-linux' 'imagemagick' 'swaylock' 'grim' 'jq')
optdepends=('wmctrl: minimize windows before locking')
makedepends=('git')
provides=('swaylock-fancy')
source=("git+https://github.com/Big-B/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # Run the install
    cd "${srcdir}/$_gitname"
    DESTDIR="$pkgdir" make install

    # Have to redirect the prefix to arch's default location
    cd "$pkgdir"/usr/bin
    sed "$_gitname" -i -e "s:^PREFIX=.*:PREFIX=/usr/share/$_gitname:g"
}
