# Maintainer: Salvatore Cirasa < info at cirasa dot dev >
pkgname=pairdrop-cli
_binname=pairdrop
pkgver=1.11.2
pkgrel=2
pkgdesc="File sharing on your local network that works on all platforms."
arch=('i686' 'x86_64')
url="https://pairdrop.net"
license=('GPLv3')
# depends=('')
archive="pairdrop-cli"
source=("https://github.com/schlagmichdoch/PairDrop/releases/download/v${pkgver}/${archive}.zip")
sha512sums=('c4ac5d5a62d813e047eb70c1116e63be121e9960b9a23dff98a6e5f3b300d05bc1aceb71391452f0141cf57fd7ef87af8510f1d37767c1e32fcdf7633e65058b')

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
