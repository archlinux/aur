# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=cfiles
pkgver=1.5
pkgrel=2
pkgdesc="A ncurses file manager written in C"
arch=('any')
url="https://github.com/mananapr/cfiles/"
license=('MIT')
depends=('ncurses' 'fzf')
optdepends=('mediainfo: to see media info'
            'atool: for archive previews'
            'python-ueberzug-git: for image previews'
            'poppler: for pdf previews'
            'w3m: for image previews')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/cfiles/archive/v${pkgver}.tar.gz")
sha256sums=('6decac548ac8f8b900bfe962407889101438889fab806327e29848f1918aae2d')

build(){
  cd "cfiles-${pkgver}"

  if [[ ! -z "${EDITOR}" ]]; then
    $EDITOR config.h
  else
    vi config.h
  fi

  make
}

package() {
  cd "cfiles-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 cfiles.1 "$pkgdir/usr/local/man/man1/cfiles.1"
  install -Dm755 cfiles "$pkgdir/usr/local/bin/cfiles"
  install -Dm755 scripts/displayimg "$pkgdir/usr/local/bin/displayimg"
  install -Dm755 scripts/displayimg_uberzug "$pkgdir/usr/local/bin/displayimg_uberzug"
  install -Dm755 scripts/clearimg "$pkgdir/usr/local/bin/clearimg"
  install -Dm755 scripts/clearimg_uberzug "$pkgdir/usr/local/bin/clearimg_uberzug"
}
