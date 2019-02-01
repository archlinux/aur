# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=cfiles
pkgver=1.1
pkgrel=2
pkgdesc="A ncurses file manager written in C"
arch=('any')
url="https://github.com/mananapr/cfiles/"
license=('MIT')
depends=('ncurses' 'fzf')
optdepends=('mediainfo: to see media info'
            'atool: for archive previews'
            'python-ueberzug-git: for image previews'
            'w3m: for image previews')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/cfiles/archive/v${pkgver}.tar.gz")
sha256sums=('e7e3340f24dc990fc24eed5218eb3670bf900d19b591338e672d8833aa74b187')

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
  install -Dm755 cfiles "$pkgdir/usr/local/bin/cfiles"
  install -Dm755 scripts/displayimg "$pkgdir/usr/local/bin/displayimg"
  install -Dm755 scripts/displayimg_uberzug "$pkgdir/usr/local/bin/displayimg_uberzug"
  install -Dm755 scripts/clearimg "$pkgdir/usr/local/bin/clearimg"
  install -Dm755 scripts/clearimg_uberzug "$pkgdir/usr/local/bin/clearimg_uberzug"
}
