# Maintainer: luke bonham <dada [at] archlinux [dot] info>

pkgname=awesome-freedesktop-git
pkgcom=98
pkgsha=4226433
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Freedesktop.org menu and desktop icons support for Awesome WM"
arch=('any')
url="https://github.com/lcpz/awesome-freedesktop"
license=('GPL2')
depends=('awesome')
makedepends=('git')
provides=('awesome-freedesktop')
conflicts=('awesome-freedesktop')
source=("git://github.com/copycat-killer/awesome-freedesktop.git")
md5sums=('SKIP')

package() {
    # check if awesome is stable or git
    if [ -d "/usr/share/awesome/lib/" ]; then
        aw_path="$pkgdir/usr/share/awesome/lib"
    else
        aw_path="$pkgdir/usr/local/share/awesome/lib"
    fi

    mv awesome-freedesktop freedesktop
    install -dm755 "$aw_path/freedesktop"
    git --git-dir=freedesktop/.git --work-tree=freedesktop/ reset --hard $pkgsha --quiet
    rm -rf freedesktop/{wiki,.git*,*.rockspec,*TEMPLATE*,*.png}
    cp -a freedesktop $aw_path
}
