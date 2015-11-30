# Maintainer: Masaki Waga <masakiwaga@gmail.com>
pkgname=open-usp-tukubai
pkgver=2014061402
pkgrel=1
pkgdesc="An open source version of shell commands usp Tukubai."
arch=('any')
url="https://uec.usp-lab.com/TUKUBAI/CGI/TUKUBAI.CGI"
license=('custom:"MIT"')
depends=('python')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("https://uec.usp-lab.com/TUKUBAI/DOWNLOAD/open-usp-tukubai-2014061402.tar.bz2" "https://gist.githubusercontent.com/MasWag/76a89b3c3056753d1d31/raw/7965251ff56c7f297849f6865e700c2d0f3c01c0/Makefile.patch")

noextract=()
md5sums=('be4f69734afd2bdc74d07fc705380c6e'
         'c4dc486deb9bf93fcaf5a8c139c57481')

build() {
  patch "$pkgname-$pkgver"/Makefile Makefile.patch
  cd "$pkgname-$pkgver"

  cat Makefile | grep "^#" | sed 's/^#//' > LICENSE
}

package() {
  cd "$pkgname-$pkgver"
  echo "$pkgdir"
  make LOCALBASE="$pkgdir" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
