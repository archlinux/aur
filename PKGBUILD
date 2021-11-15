# Maintainer: Alexandre Macabies <web+oss@zopieux.com>

pkgname=rofi-screenshot-git
_gitname=rofi-screenshot
pkgver=r8.050c3eb
pkgrel=1
pkgdesc="Use rofi and ffcast to perform various types of screenshots and screen captures"
arch=('any')
url="https://github.com/ceuk/rofi-screenshot"
license=('WTFPL')
depends=('rofi' 'slop' 'xclip' 'ffcast')
source=(
  'git+https://github.com/ceuk/rofi-screenshot.git'
  'output_dir.patch')
md5sums=('SKIP'
         '8e020b4afb615d6a3169a8f980c144a1')

pkgver() {
  cd "$_gitname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname/"
  patch --forward --strip=1 --input="${srcdir}/output_dir.patch"
}

package() {
  cd "$_gitname/"
  install -Dm755 "rofi-screenshot" "$pkgdir/usr/bin/rofi-screenshot"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
