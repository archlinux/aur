# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-easy-align-git
pkgver=2.10.0+20.g12dd631697
pkgrel=1
pkgdesc='Vim alignment plugin'
arch=('any')
LICENSE=('MIT')
url='https://github.com/junegunn/vim-easy-align'
source=("git+$url")
sha256sums=('SKIP')
provides=(vim-easy-align=${pkgver%%+*})
conflicts=(vim-easy-align)

pkgver() {
  cd vim-easy-align
  git describe --long --abbrev=10 | sed 's/-/+/; s/-/./'
}

package() {
  cd vim-easy-align

  for _dir in autoload plugin doc
  do
    install -dm755 "$pkgdir"/usr/share/vim/vimfiles/"$_dir"

    for _file in "$_dir"/easy_align.*
    do
      install -Dm644 "$_file" "$pkgdir"/usr/share/vim/vimfiles/"$_file"
    done
  done
}
