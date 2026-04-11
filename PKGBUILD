# Maintainer: Aman Adlakha <amanady125@gmail.com>
pkgname=ethos-forge
pkgver=0.5.0
pkgrel=1
pkgdesc="The Ethos Package Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanCode22/forge"
license=('Apache-2.0')
depends=('ethos-lang' 'python' 'python-zstandard' 'gcc' 'patchelf')
makedepends=('git' 'python-pip')
source=("git+https://github.com/AmanCode22/forge.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip')

build() {
  cd "forge"
  python3 -m pip install --user --break-system-packages nuitka
  python3 -m nuitka --assume-yes-for-downloads --jobs=1 --lto=no --low-memory --onefile forge.py --output-filename=forge
}

package() {
  cd "forge"
  install -Dm755 forge "${pkgdir}/usr/bin/forge"
}
