# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=vim-tabnine
pkgname=$_pkgname-git
pkgver=2.0.2
pkgrel=1
pkgdesc="TabNine is the all-language autocompleter. It uses machine learning to provide responsive, reliable, and relevant suggestions."
arch=('any')
url="https://github.com/zxqfl/tabnine-vim"
license=('https://tabnine.com/eula')
groups=('vim-plugins')
depends=('python-language-server')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('vim-youcompleteme')
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

  mkdir -p $installpath
  mkdir -p $installpath/binaries/${pkgver}  
  cp -r plugin doc autoload python third_party $installpath
  cp -r binaries/${pkgver}/x86_64-unknown-linux-gnu/  $installpath/binaries/${pkgver}

  # Remove all the unnecessary git repositories
  find "$pkgdir" -name .git -exec rm -fr {} +

  # Remove tests files
  find "$pkgdir" -name tests -exec rm -fr {} +

  # Remove unneeded docs
  find "$pkgdir" -name docs -exec rm -fr {} +

}
