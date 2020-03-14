# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jitsi-meet-git
pkgver=r1.9a162c2
pkgrel=1
epoch=
pkgdesc=""
arch=("x86_64")
url="https://github.com/jitsi/jitsi-meet"
license=("Apache")
groups=()
depends=("npm")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jitsi-meet)
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}"
  npm install
  # Make fails with more than one thread
  make -j1
}

package() {
  # Workaround so we don't overwrite user's config.js
  mv "${srcdir}/jitsi-meet-git/config.js" "${srcdir}/jitsi-meet-git/config.js.example"

  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/jitsi-meet-git/" "${pkgdir}/opt/jitsi-meet"
}
