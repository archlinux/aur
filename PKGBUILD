# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=cfiles
pkgver=1.7.2
pkgrel=1
pkgdesc="A ncurses file manager written in C"
arch=('x86_64')
url="https://github.com/mananapr/cfiles/"
license=('MIT')
depends=('ncurses' 'fzf')
optdepends=('mediainfo: to see media info'
            'atool: for archive previews'
            'python-ueberzug-git: for image previews'
            'poppler: for pdf previews'
            'w3m: for image previews')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/cfiles/archive/v${pkgver}.tar.gz")
sha256sums=('65f141e1deef8fec0bd35264a3837d98fd59fcb993d117deeb0a0a4b9543e383')

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
  install -Dm644 cfiles.1 "$pkgdir/usr/share/man/man1/cfiles.1"
  install -Dm755 cfiles "$pkgdir/usr/bin/cfiles"
  install -Dm755 scripts/displayimg "$pkgdir/usr/share/cfiles/scripts/displayimg"
  install -Dm755 scripts/displayimg_uberzug "$pkgdir/usr/share/cfiles/scripts/displayimg_uberzug"
  install -Dm755 scripts/clearimg "$pkgdir/usr/share/cfiles/scripts/clearimg"
  install -Dm755 scripts/clearimg_uberzug "$pkgdir/usr/share/cfiles/scripts/clearimg_uberzug"
}
