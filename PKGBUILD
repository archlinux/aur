# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgbase=croco-gnome-settings
_gitname=croco-gnome-settings
pkgname=(
    'croco-gnome-settings'
    )
pkgver=r77.94ad064
pkgrel=1
arch=('any')
_branch='master'
url="https://gitlab.com/croco-os/themes-and-settings/settings/croco-gnome-settings"
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
	cd "$srcdir/croco-gnome-settings"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_croco-gnome-settings() {
    pkgdesc='Croco OS GNOME settings'
    depends=(
        'croco-common-settings'
        'kvantum-qt5'
        'nerd-fonts-fantasque-sans-mono'
        'qt5ct'
        'yaru-sound-theme'
        )
 
    install=croco-gnome-settings.install
    provides=('croco-desktop-settings')
    conflicts=('croco-desktop-settings' 'sweet-theme-dark' 'sweet-theme-git' 'kvantum-theme-sweet-git' 'xcursor-sweet')

    _install ''
}
