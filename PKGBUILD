# Maintainer: Leon <adigitoleo@protonmail.com>
pkgname=python-enaml-git
_shortname="${pkgname%-git}"
pkgver=0.12.0.r10.g3e58a3c2
pkgrel=2
pkgdesc="Declarative User Interfaces for Python"
arch=(x86_64)
url="https://github.com/nucleic/enaml"
license=('custom')
depends=('python-qtpy' 'python-ply' 'python-kiwisolver' 'python-atom' 'python-bytecode')
makedepends=('python-setuptools' 'python-cppy' 'git')
provides=("$_shortname")
conflicts=("$_shortname")
source=("$_shortname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_shortname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_shortname"
    python setup.py build
}

package() {
    cd "$srcdir/$_shortname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_shortname/"

    # Install supporting files (editor plugins).
    install -Dm644 ./tools/vim/ftdetect/enaml.vim -t "$pkgdir/usr/share/vim/vimfiles/ftdetect"
    install -Dm644 ./tools/vim/ftdetect/enaml.vim -t "$pkgdir/usr/share/nvim/runtime/ftdetect"
    install -Dm644 ./tools/vim/syntax/enaml.vim -t "$pkgdir/usr/share/vim/vimfiles/syntax"
    install -Dm644 ./tools/vim/syntax/enaml.vim -t "$pkgdir/usr/share/nvim/runtime/syntax"
    install -Dm644 ./tools/vim/indent/enaml.vim -t "$pkgdir/usr/share/vim/vimfiles/indent"
    install -Dm644 ./tools/vim/indent/enaml.vim -t "$pkgdir/usr/share/nvim/runtime/indent"
    install -Dm644 ./tools/emacs/enaml.el -t "$pkgdir/usr/share/emacs/site-lisp"
}
