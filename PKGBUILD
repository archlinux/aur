# Maintainer: billypilgrim <billypilgrim@gmx.co.uk>
pkgname=git-hub
pkgver=1.0.1
pkgrel=1
pkgdesc="Git command line interface to GitHub"
arch=('any')
url="https://github.com/sociomantic-tsunami/git-hub"
license=('GPLv3')
depends=('python2' 'git' 'bash-completion')
makedepends=('python2-docutils')

source=(
    "git+https://github.com/sociomantic-tsunami/git-hub.git#tag=v$pkgver"
)

sha1sums=(
    'SKIP'
)

prepare ()
{
    cd $srcdir
    sed -i "s/rst2man/rst2man2/g" $pkgname/Makefile
    sed -i "s/:= python/:= python2.7/g" $pkgname/Makefile
}

build ()
{
    cd $pkgname
    make all
}

package ()
{
    cd $srcdir/$pkgname
    make DESTDIR=$pkgdir prefix=/usr install
}
