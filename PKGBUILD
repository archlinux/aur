# Maintainer: Aman Adlakha <amanady125@gmail.com>
pkgname=ethos-lang
pkgver=0.5.0
pkgrel=1
pkgdesc="The Ethos Programming Language Compiler"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanCode22/ethos-lang"
license=('Apache-2.0')
depends=('python' 'python-zstandard' 'gcc' 'patchelf')
optdepends=('ethos-forge: for managing Ethos packages and projects')
makedepends=('git' 'python-pip')
source=("git+https://github.com/AmanCode22/ethos-lang.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip')

build() {
  cd "${pkgname}"
  # Install Nuitka locally for build
  python3 -m pip install --user --break-system-packages nuitka
  # Compile Ethos using memory-safe flags
  python3 -m nuitka --assume-yes-for-downloads --jobs=1 --lto=no --low-memory --onefile main.py --output-filename=ethos
}

package() {
  cd "${pkgname}"
  install -Dm755 ethos "${pkgdir}/usr/bin/ethos"
}
