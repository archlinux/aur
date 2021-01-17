# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=vim-tabnine
pkgver=2.10.0
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
sha256sums=('1fb8cdf269b7d23de92d88c16b9404ddcbe6967f41bea96f6c1dd1ca4fe6e53c')

package() {
  cd "$srcdir/tabnine-vim-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  binariesver=$(grep -Eo '!binaries/.*' .gitignore | cut -c10-)

  mkdir -p $installpath
  mkdir -p $installpath/binaries/${pkgver}  
  cp -r plugin doc autoload python third_party $installpath
  cp -r binaries/${binariesver}/x86_64-unknown-linux-musl/  $installpath/binaries/${binariesver}

  # Remove all the unnecessary git repositories
  find "$pkgdir" -name .git -exec rm -fr {} +

  # Remove tests files
  find "$pkgdir" -name tests -exec rm -fr {} +

  # Remove unneeded docs
  find "$pkgdir" -name docs -exec rm -fr {} +
}
