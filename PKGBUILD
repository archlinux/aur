# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="keysound-git"
pkgver=r193.10f3798
pkgrel=1
pkgdesc="A keyboard sound software for Linux "
license=("MIT")
arch=("x86_64")
url="https://github.com/fgheng/keysound"
makedepends=("git")
depends=("libpulse")
optdepends=("sdl2: SDL2 backend")
source=("git+$url")
sha256sums=("SKIP")
install="keysound.install"

pkgver(){
 cd "keysound"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
 cd "keysound"
 # use absolute dir
 find "audio" -type f -exec sed -i {} -e 's|./|/usr/share/keysound/|' \;
}

build(){
 cd "keysound"
 # one can use different backends
 # a clean environment is required for switching backend
 # "sdl" requires the package "sdl2" to be installed
 make CFLAG=pulse
 #make CFLAG=sdl
 #make CFLAG=alsa
}

package(){
 cd "keysound"
 install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/share/keysound"
 mv "keysound" "$pkgdir/usr/bin"
 cp -r "audio" "$pkgdir/usr/share/keysound"
}
