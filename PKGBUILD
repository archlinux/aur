pkgname='polyenum-git'
pkgver='0.1_1'
pkgrel=2
arch=('any')
pkgdesc='Set of enumerators of multiple types of polyominoes (snake, tree, etc.)'
url='https://bitbucket.org/ablondin/polyenum'
license=('GPL3')
depends=('python2' 'cython2')
makedepends=('sed')
source=("git+https://bitbucket.org/ablondin/polyenum")
sha256sums=('SKIP')

build () {
    cd "$srcdir/${pkgname%-*}"
    git checkout 0.1-1
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname%-*}"

    # python polyenum module and script
    python2.7 setup.py bdist --dist-dir .
    tar -xvzf polyenum-0.1-1.linux-x86_64.tar.gz -C $pkgdir

    # bash completion
    install -Dpv scripts/bash_completion/polyenum \
        $pkgdir/usr/share/bash-completion/completions/polyenum

    # man page
    gzip doc/polyenum.1
    install -Dpv doc/polyenum.1.gz $pkgdir/usr/share/man/man1/polyenum.1.gz
}
