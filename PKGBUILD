# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_depends="python>=3.2"
pkgname="python-argparse-shim"
pkgver=3.11.3
pkgrel=1
pkgdesc="Explicitly provides the dependency 'python-argparse', which is part of 'python'. The package 'python-argparse' must not be installed, but some packages depend on it, so this is a workaround. See https://bugs.archlinux.org/task/78484."
arch=(
  'any'
)

url="https://www.python.org"
license=("custom: Public Domain.")
depends=(
  "${_depends}"
)
makedepends=()
checkdepends=()
provides=(
  "python-argparse=${pkgver}"
)
replaces=(
  "python-argparse"
)
conflicts=(
  "python-argparse"
)
replaces=()

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  'af68dd29515606a94237214e4c33b0e3f4f2408ed92df3674a043bf2fa2c0078'
)
pkgver() {
  pacman -Q "${_depends%%>*}" | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}
