# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=vim-tabnine
pkgver=2.5.1
pkgrel=1
pkgdesc="TabNine is the all-language autocompleter. It uses machine learning to provide responsive, reliable, and relevant suggestions."
arch=('any')
url="https://github.com/codota/tabnine-vim"
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
sha256sums=('a7fb111e4dbc7ea728977652880b4f79a63cfca14e68082101f76e3e58e601f5')

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
