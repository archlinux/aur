# Maintainer: James Callahan <james@wavesquid.com>

pkgname=qubes-split-gpg2
pkgver=1.0.0
pkgrel=1
pkgdesc="separate the handling of private key material from the rest of GnuPG's processing"
arch=('x86_64')
url='https://github.com/qubesos/qubes-app-linux-split-gpg2/'
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
options=(!lto)
source=("qubes-app-linux-split-gpg2-${pkgver}.tar.gz::https://github.com/QubesOS/qubes-app-linux-split-gpg2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f26a712093925593882ab2f26b84da21b92e941f4e82f49c231af797a945d668')

build() {
  cd "qubes-app-linux-split-gpg2-${pkgver}"

  make
}

package() {
  cd "qubes-app-linux-split-gpg2-${pkgver}"

  make install DESTDIR="${pkgdir}"
  # Arch doesn't do systemd enabled presets
  rm "${pkgdir}/usr/lib/systemd/user-preset/70-split-gpg2-client.preset"
  # Don't install integration tests
  rm -r "${pkgdir}/usr/share/split-gpg2-tests/"
}
