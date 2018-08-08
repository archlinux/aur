# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=lazygit
pkgver=0.1.18
pkgrel=1
pkgdesc="A simple terminal UI for git commands"
arch=("x86_64")
url="https://github.com/jesseduffield/${pkgname}"
license=("MIT")
depends=("glibc")
makedepends=("go-pie")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jesseduffield/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("35c4e8629d3ab67a7e24ab4c80544eccc53709fecc85b6ebccf56046305079c0")

build () {
  msg2 "Linking to repository path..."
  mkdir -p "${srcdir}/src/github.com/jesseduffield"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/jesseduffield/"
  cd "${srcdir}/src/github.com/jesseduffield/${pkgname}-${pkgver}"
  
  msg2 "Building..."
  GOPATH="${srcdir}" PATH="$PATH:$GOPATH/bin" go build -o "${pkgname}"
  
  msg2 "Removing link..."
  rm -rf "${srcdir}/src"
}

package () {
  msg2 "Installing..."
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/docs/Keybindings.md" "${pkgdir}/usr/share/doc/${pkgname}/Keybindings.md"
}
