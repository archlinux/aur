# Maintainer: Salvatore Cirasa < info at cirasa dot dev >
pkgname=pairdrop-cli
_binname=pairdrop
pkgver=1.10.10
pkgrel=1
pkgdesc="File sharing on your local network that works on all platforms."
arch=('i686' 'x86_64')
url="https://pairdrop.net"
license=('GPLv3')
# depends=('')
archive="pairdrop-cli"
source=("https://github.com/schlagmichdoch/PairDrop/releases/download/v${pkgver}/${archive}.zip")
sha512sums=('a1ac835bc4981b309369fdb18baab53f6c1c2350b0a180afe87d9567691ff4c8a207bd457c1f445876ea58dd2b8f2df80fce245abb4234839f4e49f1310ed3b1')

package() {
  mkdir -p "$srcdir/${pkgname}"
  bsdtar -xvf "${archive}.zip" -C "$srcdir/${pkgname}"

  # Move main files to proper directory
  install -d -m 0755 "$pkgdir/usr/share/"
  cp "$srcdir/${pkgname}/.pairdrop-cli-config.example" "$srcdir/${pkgname}/.pairdrop-cli-config"
  chmod +x "${srcdir}/${pkgname}/${_binname}"
  cp -r "${srcdir}/${pkgname}" "$pkgdir/usr/share/"

  # Create binary symlink
  mkdir -p "$pkgdir/usr/local/bin"
  ln -sf "/usr/share/${pkgname}/${_binname}" "$pkgdir/usr/local/bin/${_binname}"
}
