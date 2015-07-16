# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>

pkgname=neobundle-git
pkgver=3.0.32.g2f94664
pkgrel=1
pkgdesc="Ultimate Vim plugin manager inspired by Vundle"
arch=('any')
url="https://github.com/Shougo/neobundle.vim"
license=('GPL')
depends=('vim>=7.2.051')
makedepends=('git')
install=neobundle.install
source=('neobundle-git::git+https://github.com/Shougo/neobundle.vim.git'
        'neobundle.vimrc'
       )
sha512sums=('SKIP'
            '0f213143dca741957c9873fe881666b86b66fa285db6e3fdd85f4121596798169de6201b3660b1960602a0e6f2bc54ddb98a4ff42041e7ce59b08bd75190ec01'
           )

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags | sed -E 's/^ver\.//;s/-/./g'
    
}
package() {
  cd "$srcdir/$pkgname"

  vimpath="${pkgdir}/usr/share/vim/vimfiles/"

  mkdir -p ${vimpath}/doc
  cp -R doc ${vimpath}

  mkdir -p ${vimpath}/autoload
  cp -R autoload ${vimpath}

  install -Dm644 LICENSE-MIT.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 ${srcdir}/neobundle.vimrc ${pkgdir}/usr/share/neobundle/vimrc.sample
}

