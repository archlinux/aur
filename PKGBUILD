# Maintainer: 2ion <dev@2ion.de>
pkgname=bunsen-utilities-git
pkgver=r72.22e76e4
pkgrel=1
pkgdesc="Collection of utility scripts"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-utilities"
license=('GPL3')
depends=('python' 'pygtk' 'python-xlib' 'python-lxml')
optdepends=(\
  'upower: Required for bl-exit' \
  'zenity: Required bl-conkyzen and bl-tint2edit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(\
  "${pkgname%-git}::git+https://github.com/BunsenLabs/bunsen-utilities.git#branch=master" \
  'https://raw.githubusercontent.com/Unia/bunsen-utilities/master/bl-aerosnap' \
  'https://raw.githubusercontent.com/Unia/bunsen-utilities/rewrite-hotcorners/bl-hotcorners' \
  'bl-kb-python2-path.patch' \
  'bl-exit-python2-path.patch' \
  'bl-hotcorners-syntax.patch')
md5sums=(\
  'SKIP' \
  'SKIP' \
  'SKIP' \
  'af06407c74e40698d716acd5ddee6966' \
  '967a191ca673aec93546640002c794ab' \
  '2cb280313bd01a391437e4b960142d80')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch bl-kb ../bl-kb-python2-path.patch
  patch bl-exit ../bl-exit-python2-path.patch
  cd "$srcdir" ; cd ..
  patch bl-hotcorners bl-hotcorners-syntax.patch
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" bl-*
  cd "$srcdir"
  install -t "${pkgdir}/usr/bin" bl-aerosnap
  install -t "${pkgdir}/usr/bin" bl-hotcorners
}
