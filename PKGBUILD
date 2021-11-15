pkgname=tribal-trouble-git
pkgver=20200126
pkgrel=1
pkgdesc='Real-time strategy game that pits natives of tropical islands against invading Vikings'
arch=(x86_64)
url="https://github.com/team-penguin/tribaltrouble"
license=('GPL')
depends=(java-runtime)
makedepends=(ant gendesk mercurial)
install=tribaltrouble.install
source=(git+https://github.com/team-penguin/tribaltrouble.git tribaltrouble.sh tribaltrouble.install)
md5sums=('SKIP'
         '89bd4abf950f7c5cf95de0b41af10554'
         'daf69f6c879f3401ca168cc7d035e5db')
options=('!strip')

pkgver() {
  cd tribaltrouble
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  gendesk -f -n --pkgname tribaltrouble --pkgdesc "${pkgdesc}" --exec "tribaltrouble" --categories "Game;StrategyGame"
}


build() {
  cd $srcdir/tribaltrouble/tt
  ant makedist
}

package() {
  mkdir -p "${pkgdir}/usr/share/games/tribaltrouble"
  cd $srcdir/tribaltrouble/tt/build/dist
  cp -R . "${pkgdir}/usr/share/games/tribaltrouble"
  install -Dm755 "${srcdir}/tribaltrouble.sh" "${pkgdir}/usr/bin/tribaltrouble"
  install -Dm644 "${srcdir}/tribaltrouble.desktop" "$pkgdir/usr/share/applications/tribaltrouble.desktop"
}

