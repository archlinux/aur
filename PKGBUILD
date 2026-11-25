# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cayley-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="An open-source graph database"
arch=('x86_64' 'aarch64')
url="https://github.com/cayleygraph/cayley"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cayley_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cayley_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c2604af5a549ed30ea817dd4bc9a206ba29d82e1949c805ac6a9179e214ca6c2')
sha256sums_aarch64=('a96827df89ff306ad8dfe9019b85aac60145dbfdf8fd27ebfa1fbd6fae2006ce')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cayley_${pkgver}_linux_amd64" ;;
    aarch64) _dir="cayley_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/cayley" "${pkgdir}/usr/bin/cayley"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
