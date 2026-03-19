# Maintainer: Javad <ja7ad@live.com>

pkgname=electerm-live-bin
pkgver=2.16.9
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal (Live version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://electerm.html5beta.com"
license=('MIT')
_pkgname="electerm"

provides=("electerm")
conflicts=("electerm" "electerm-git")

source=(
  "LICENSE::https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
)

case "$CARCH" in
  x86_64)  _arch="amd64" ;;
  aarch64) _arch="arm64" ;;
  armv7h)  _arch="armv7l" ;;
  *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
esac

_deb="${_pkgname}-${pkgver}-linux-${_arch}.deb"

source+=("$_deb::https://github.com/electerm/electerm/releases/download/v${pkgver}/${_deb}")

sha256sums=('SKIP' 'SKIP')

package() {
  if [ -f "${srcdir}/data.tar.xz" ]; then
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  elif [ -f "${srcdir}/data.tar.zst" ]; then
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  else
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
  fi

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}