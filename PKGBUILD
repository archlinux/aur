# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cvassistant-git
pkgver=3.1.0.r156.7fd97f4
pkgrel=2
pkgdesc="Helps you create specialized resumes in Word .docx format fast and easy"
arch=('x86_64')
url="https://cvassistant.sourceforge.io"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'quazip-legacy')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.code.sf.net/p/cvassistant/code.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "3.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir" install
}
