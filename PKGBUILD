# Maintainer: Antonio Prates <hello@aprates.dev>

pkgname=fatscript-fry
pkgver=1.0.0
pkgrel=1
pkgdesc="fry, the fatscript interpreter"
arch=('any')
url="https://fatscript.org/"
license=('GPL3')
groups=('fatscript')
depends=('ncurses' 'readline' 'libcurl-compat')
makedepends=('git' 'gcc' 'bash' 'ncurses' 'readline' 'libcurl-compat')
source=("git+https://gitlab.com/fatscript/fry.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  mv "${srcdir}/fry" "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./compile.sh
}

check() {
  cd "${srcdir}/${pkgname}"
  ./run_tests.sh
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/fry "${pkgdir}/usr/local/bin/fry"
  install -Dm644 man/fry.1 "${pkgdir}/usr/local/man/man1/fry.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  if [ -d "/usr/share/nano/" ]; then
    install -Dm644 extras/fat.nanorc "${pkgdir}/usr/share/nano/fat.nanorc"
  fi
}
