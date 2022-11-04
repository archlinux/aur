# Maintainer: dreieck

_pkgname="nordtray-executable-symlink"
pkgname="${_pkgname}-latest"
pkgver=0.1.1
pkgrel=1
pkgdesc="Makes the '/usr/lib/nordtray/nordtray'-executable provided by the 'nordtray' package available in '/usr/bin/nordtray'."
arch=("any")
url="https://aur.archlinux.org/packages/${pkgname}"
license=('custom: public domain')
depends=("nordtray")
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  '1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6'
)

pkgver() {
  pacman -Q nordtray | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  install -d -v -m755 "${pkgdir}/usr/bin"
  ln -s -v -T "/usr/lib/nordtray/nordtray" "${pkgdir}/usr/bin/nordtray"

  install -D -v -m 644 -T "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
