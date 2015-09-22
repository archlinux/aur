    pkgname=thea-git
    _pkgname=thea
    pkgver=20140105
    pkgrel=2
    pkgdesc="A simple backup tool for desktop computers"
    arch=('any')
    url="https://projects.kde.org/projects/playground/base/kio-mtp"
    license=('BSD')
    depends=('rsnapshot' 'zsh' 'yad' 'sudo' 'gksu' 'colordiff')
    makedepends=('make')
    conflicts=('thea')
    provides=('thea')
    install="config.install"
    _gitroot="https://github.com/plp13/$_pkgname"
    _gitname="$_pkgname"

    build() {
	    cd $srcdir
	    
	    if [ -d $_gitname ]
	    then
		    rm -fr $_gitname
	    fi
	    git clone $_gitroot $_gitname --depth=1

	    cd $srcdir/$_gitname
	    sed -e 's/\/usr\/local/\/usr/g' -i Makefile thea-*
    }
    package() {
	    cd $srcdir/$_gitname
	    make PREFIX=$pkgdir/usr install
	    mv $pkgdir/usr/share/thea/config $pkgdir/usr/share/thea/config.dist
    }
