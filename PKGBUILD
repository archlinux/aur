# Maintainer: korei999 <ju7t1xe@gmail.com>
pkgname=kmp3-git
pkgver=1
pkgrel=1
# epoch=
pkgdesc="Easy music in the terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/korei999/kmp3.git"
license=('MIT')
depends=('ffmpeg' 'libpipewire' 'chafa' 'glib2' 'systemd-libs')
makedepends=('git' 'cmake')
# optdepends=('chafa: for image display support'
#             'systemd-libs: for mpris-dbus support')
# conflicts=('kmp3')
# provides=('kmp3')
source=('git+https://github.com/korei999/kmp3.git')
sha256sums=('SKIP')
_gitname=kmp3

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_gitname"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo
    cmake --build ./build -j
}

package() {
	cd "$_gitname"
    install -Dm755 build/kmp3 "$pkgdir/usr/bin/kmp3"
}
