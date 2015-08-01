# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Aurélien Chabot <contact@aurelienchabot.fr>
# Contributor: Étienne Deparis <etienne@depar.is>

pkgname=progress-git
pkgdesc="Shows running coreutils basic commands and displays stats"
pkgver=20150731
pkgrel=1
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('gcc' 'git' 'make')
url="https://github.com/Xfennec/progress"
license=('GPL3')
source=(git+https://github.com/Xfennec/progress)
sha256sums=('SKIP')
replaces=('cv')
provides=('progress')
conflicts=('progress')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg2 'Installing documentation...'
  for _doc in capture.png README.md; do
    install -Dm 644 "$_doc" "$pkgdir/usr/share/doc/${pkgname%-git}/$_doc"
  done

  msg2 'Installing...'
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
