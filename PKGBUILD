# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgbase=croco-common-settings-git
_gitname=croco-common-settings-git
pkgname=(
    'croco-common-settings-git'
    )
pkgver=r40.187953a
pkgrel=1
arch=('any')
_branch='master'
url="https://gitlab.com/croco-os/themes-and-settings/settings/croco-common-settings"
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
	cd "$srcdir/croco-common-settings"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_croco-common-settings() {
    pkgdesc='Croco OS Linux common settings'
    depends=(
	'croco-icons'	
	#'croco-browser-settings'
	'croco-hooks'
	'haveged'
    'irqbalance'
    'systemd-swap'   
    'nohang-git'
    'prelockd-git'
    'memavaild-git'
	'ananicy-git'
    'profile-sync-daemon'
    'preload'
    )
    optdepends=(
        'performance-tweaks'
        )    
    install=croco-common-settings.install

    _install ''
}

