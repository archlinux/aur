# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify-git
_gitname=psi-notify
pkgver=0.3.r23.g7d356b1
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify (git version)'
url="https://github.com/cdown/psi-notify"
license=('MIT')
arch=('any')
depends=(libnotify)
provides=(psi-notify)
conflicts=(psi-notify)
makedepends=(git)
source=(git://github.com/cdown/psi-notify.git)
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd -- "$_gitname"
    make
}

package() {
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/systemd/user
    cp -a "${srcdir?}/$_gitname"/psi-notify "$pkgdir"/usr/bin
    cp -a "${srcdir?}/$_gitname"/psi-notify.service \
	"$pkgdir"/usr/lib/systemd/user
}
