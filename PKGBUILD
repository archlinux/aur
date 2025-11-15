# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap.at
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: orumin <dev@orum.in>

pkgname=coccigrep
pkgver=1.21
pkgrel=3
pkgdesc='Semantic grep for the C language based on coccinelle'
arch=('any')
url='https://home.regit.org/software/coccigrep/'
license=('GPL-3.0-only')
depends=('coccinelle' 'python' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
source=(
    $pkgname-$pkgver.tar.gz::"https://github.com/regit/coccigrep/archive/v$pkgver.tar.gz"
    0001-fix-sphinx-manpage-build.patch::"https://github.com/regit/coccigrep/commit/b774e8978029cec34660b874cf88fc30fb9b8f97.patch"
       )
b2sums=('2645d790836e6f75d449464040cd48b49dac915f546546b9908f502aebd628e4ada8ae681194cc5ff66fd31e4f0496aaac5dfedc62011560b3638370c1d23d4f'
        '09853c277989c54a0982df79a102e69e6b2163e6d705c2b44bdb649e1b06bc12560f4d594b66829f031b26d7f04281eb0c24b43f2261e4bcb148444ad599b504')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 coccigrep.1 -t $pkgdir/usr/share/man/man1/

    # Emacs modes
    install -Dm644 editors/cocci-grep.el -t $pkgdir/usr/share/emacs/site-lisp/

    # vim
    install -Dm644 editors/cocci-grep.vim -t $pkgdir/usr/share/vim/vimfiles/plugin/
}
