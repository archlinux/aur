# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=vim-tabnine
pkgver=2.1.11
pkgrel=1
pkgdesc="TabNine is the all-language autocompleter. It uses machine learning to provide responsive, reliable, and relevant suggestions."
arch=('any')
url="https://github.com/zxqfl/tabnine-vim"
license=('https://tabnine.com/eula')
groups=('vim-plugins')
depends=('vim' 'python-language-server')
makedepends=()
provides=()
conflicts=()
replaces=('vim-youcompleteme' 'vim-tabnine-git')
backup=()
options=()
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('48e15d0212a96b181db06146f7cc82f8617673260a8be9e4fc43b57ab1236a9a')

package() {
  cd "$srcdir/tabnine-vim-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  mkdir -p $installpath
  mkdir -p $installpath/binaries/${pkgver}  
  cp -r plugin doc autoload python third_party $installpath
  cp -r binaries/${pkgver}/x86_64-unknown-linux-musl/  $installpath/binaries/${pkgver}

  # Remove all the unnecessary git repositories
  find "$pkgdir" -name .git -exec rm -fr {} +

  # Remove tests files
  find "$pkgdir" -name tests -exec rm -fr {} +

  # Remove unneeded docs
  find "$pkgdir" -name docs -exec rm -fr {} +
}
