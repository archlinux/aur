# Maintainer: Salvatore Cirasa < info at cirasa dot dev >
pkgname=pairdrop-cli
_binname=pairdrop
pkgver=1.10.8
pkgrel=1
pkgdesc="File sharing on your local network that works on all platforms."
arch=('i686' 'x86_64')
url="https://pairdrop.net"
license=('GPLv3')
# depends=('')
archive="pairdrop-cli"
source=("https://github.com/schlagmichdoch/PairDrop/releases/download/v${pkgver}/${archive}.zip")
sha512sums=('d3677f775607aae8483a13a009e367656ff832515b482b6444db462ef3ee4a081f07e7123cda24306207000e290ad31abdf1bca368f87b3bba09b2881da8adf0')

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
