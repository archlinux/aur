# Maintainer: Johannes Garz <johannes@garz.dev>

pkgname='acronis-cyber-protect-bin'
pkgver=15.0.30984_1
pkgrel=1
pkgdesc='Acronis Cyber Protect On-Premises installer'
arch=('x86_64')
url='https://www.acronis.com/products/cyber-protect/'
license=('unknown')
depends=('dkms' 'java-runtime=8' 'rpm' 'gcc-libs' 'make' 'perl' 'linux-headers')
makedepends=()
install="$pkgname.install"

setup="AcronisCyberProtect_15_64-bit.x86_64"
source=("$setup::https://dl.acronis.com/u/AcronisCyberProtect15/Release/AcronisCyberProtect_15_64-bit.x86_64"
  "$pkgname.install")
noextract=("${source[@]%%::*}")
sha256sums=('5ca66c8c0105e09a55ed8673f24607fc975cef1c371d46f967bf77618b331196'
  'd2719245a15efe1fa7489c913b7545281095c1821b52ede86919e9ff6171ffcc')

package() {
  cd "$srcdir"

  install -Dm755 "./$setup" "$pkgdir/opt/acronis/cyber-protect/$setup"
}

pkgver() {
  exe=$(strings -d "$setup" | sed -nr '/AcronisBackupLinuxStandaloneComponents-15\.0\.(([0-9_])+)/{p;q}')
  ver=$(echo $exe | cut -d '-' -f 2,3 | cut -d '.' -f 1-3)
  echo ${ver//-/_}
}
