# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=clightd-git
_gitname=Clightd
pkgver=r5.8fb5392
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('systemd' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit' 'libxss')
makedepends=('git')
optdepends=('clight-git: user service to automagically change screen backlight matching ambient brightness.')
source=("git://github.com/FedeDP/${_gitname}.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_gitname
    make
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR="$pkgdir" install
}
