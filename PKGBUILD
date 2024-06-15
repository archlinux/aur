# Maintainer: myl7 <myl@myl.moe>

_pkgname=open-enclave
pkgname="$_pkgname-bin"
pkgver=0.19.6
pkgrel=1
pkgdesc='Open Enclave SDK'
arch=('x86_64')
url='https://openenclave.io/sdk/'
# _giturl='https://github.com/openenclave/openenclave'
# Since it bundles all submodule deps
license=('Apache-2.0')
optdepends=(
  'openssl-1.1: for bundled tools and linked with host part when building'
  'clang14: can build'
)
changelog="$_pkgname.changelog.md"
source=(
  "https://github.com/openenclave/openenclave/releases/download/v${pkgver}/Ubuntu_2004_${_pkgname}_${pkgver}_amd64.deb"
  'LICENSES'
)
# The following URL has not been updated:
#   "https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/o/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
sha256sums=('1a1d77aedb753be262d5e4150e484593af2a9c2c45d28fc1c44c8f7ddf820e6b'
            'a9c03d39d11e672c5f1df92576d8e02ee40c661830c9e759ed90b749193f4970')
# Open Enclave ships debug symbols as a SDK and it can be not good to strip them
options=(!strip !debug)

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  install -D -m644 "$srcdir/LICENSES" "$pkgdir/usr/share/licenses/${pkgname}/LICENSES"
}
