# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=vim-tabnine-git
pkgdesc="TabNine is the all-language autocompleter. It uses machine learning to provide responsive, reliable, and relevant suggestions."
pkgver=3.6.8
pkgrel=1
arch=('any')
url="https://github.com/zxqfl/tabnine-vim"
license=('https://tabnine.com/eula')
groups=('vim-plugins')
depends=('vim' 'python-lsp-server')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('vim-youcompleteme' 'vim-tabnine')
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}/binaries"
	printf "%s" "$(ls)" 
}

package() {
  cd "$srcdir/${pkgname%-git}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  binary_dir=$(echo binaries/*/x86_64*linux*)
  
  mkdir -p $installpath
  mkdir -p $installpath/binaries/${pkgver}  
  cp -r plugin doc autoload python third_party $installpath
  cp -r ${binary_dir}  $installpath/${binary_dir}

  # Remove all the unnecessary git repositories
  find "$pkgdir" -name .git -exec rm -fr {} +

  # Remove tests files
  find "$pkgdir" -name tests -exec rm -fr {} +

  # Remove unneeded docs
  find "$pkgdir" -name docs -exec rm -fr {} +

}
