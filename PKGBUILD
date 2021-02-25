# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Librewish <librewish@gmail.com>
# Contributor: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgbase=croco-kde-settings
_gitname=croco-kde
pkgname=(
    'croco-kde'
    )
pkgver=r54.95147ad
pkgrel=1
arch=('any')
_branch='master'
url="https://gitlab.com/croco-os/themes-and-settings/settings/croco-kde-settings"
license=('GPL')
makedepends=('git')
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')

_install() {
    if [[ -d $srcdir/$_gitname/$1/etc ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/etc $pkgdir
    fi

    if [[ -d $srcdir/$_gitname/$1/usr ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/usr $pkgdir
    fi
    
    if [[ -d $srcdir/$_gitname/$1/skel ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/skel $pkgdir/etc
    fi

}

pkgver() {
	cd "$srcdir/croco-kde-settings"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_croco-kde() {
    pkgdesc='kde settings'
    depends=(
        'kvantum-qt5'
        'croco-icons'
        'nerd-fonts-fantasque-sans-mono'
        'ttf-fira-sans'
        'plasma5-applets-window-buttons'
        'plasma5-applets-window-appmenu'
        'plasma5-applets-window-title'
        'bigsur-dark'
        'whitesur-kde-theme-git'
        'mcmojave-cursors'
    )
  
    install=croco-kde.install
    provides=('croco-desktop-settings')
    conflicts=('croco-desktop-settings' 'kvantum-theme-sweet')

    _install ''
}
