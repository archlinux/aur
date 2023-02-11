# Contributor: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Manuel Palenzuela <sadshinobi@protonmail.com>

author=RaitaroH
pkgname=adl-git
_gitname=adl
pkgver=0.r235.19c098b
pkgrel=2
pkgdesc='anime-downloader + trackma wrapper'
url='https://github.com/RaitaroH/adl'
arch=('any')
license=('GPL')
depends=('trackma-git' 'fzf' 'anime-downloader' 'mpv')
optdepends=('frece: support for frece (recently watched)')
makedepends=('git')
provides=('adl')

source=("git+https://github.com/$author/$_gitname.git")

sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$_gitname"
  install -Dm755 adl "${pkgdir}/usr/bin/$_gitname"
  chmod +x "$pkgdir/usr/bin/$_gitname"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$_gitname"
  chmod -R 777 "$pkgdir/usr/share/$_gitname"
  printf "\033[0;31mDont forget to set up trackma before launching the script. (https://github.com/z411/trackma)\n"
}
