# Maintainer: Librewish <librewish@gmail.com>


pkgbase=deepin-kcm-integration-git
_gitname=deepin-kcm-integration
pkgname=(
    'deepin-kcm-integration-git'
    )
pkgver=r2.82617c8
pkgrel=1
arch=('any')
_branch='master'
url="https://github.com/librewish/deepin-kcm-integration"
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
	cd "$srcdir/deepin-kcm-integration"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_deepin-kcm-integration-git() {
    pkgdesc='kcm support for deepin'
depends=("kde-cli-tools" "kwin" "plasma-workspace")
optdepends=('kdeconnect: kdeconnect kcm support'
	    'plasma-thunderbolt: thunderbolt kcm support'
	   )

    provides=('deepin-kcm-integration')

    _install ''
}

