# Maintainer: dringsim <dringsim@qq.com>

pkgname=vim-hexmode-git
pkgver=20230208
pkgrel=1
pkgdesc="Vim plugin to edit binary files in a hex mode automatically."
arch=('any')
depends=('vim')
makedepends=('git')
url="https://github.com/fidian/hexmode"
license=('CC-BY-SA-3.0')
source=(${pkgname%-git}::git+https://github.com/fidian/hexmode)
sha256sums=('SKIP')
provides=('vim-hexmode')
conflicts=('vim-hexmode')

pkgver() {
  cd ${pkgname%-git}
  TZ=UTC git log -1 --format="%cd" --date=short-local | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in doc plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

