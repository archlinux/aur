# Maintainer: Ramana Kumar <firstname.lastname @ gmail at com>
pkgname=vim-inkpot-git
pkgver=20120720
pkgrel=2
pkgdesc="Inkpot, a dark scheme for GUI and 88/256 colour terms"
arch=('i686' 'x86_64')
url="http://github.com/ciaranm/inkpot"
license=('GPL')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
_gitroot="git://github.com/ciaranm/inkpot.git"
_gitname="inkpot"

build() {
    cd $srcdir
    msg "Connecting to GIT server..."

    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    install -D colors/inkpot.vim ${pkgdir}/usr/share/vim/vimfiles/colors/inkpot.vim || return 1
}
