# Maintainer: Ruben De Smet <aur AT rubdos DOT be>

pkgname=rofi-mpd-git
_gitname=Rofi_MPD
pkgver=r21.c639c38
pkgrel=1
pkgdesc="A Rofi menu for interacting with MPD written in Python."
arch=('i686' 'x86_64')
url="https://github.com/JakeStanger/Rofi_MPD"
license=('MIT')
makedepends=('git')
depends=('python')

source=("git+https://github.com/JakeStanger/Rofi_MPD.git")

sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    PYVER=$(python --version | awk '{ print $2 }' | awk -F . '{ print $1 "." $2 }')
    PYPATH=/usr/lib/python$PYVER/site-packages/

    cd $_gitname/

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rofi-mpd/LICENSE"
    install -Dm755 main.py "$pkgdir/usr/bin/rofi-mpd"
    install -Dm644 rofi.py "$pkgdir$PYPATH/rofi.py"
}
