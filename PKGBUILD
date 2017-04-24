# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=passera
pkgver=0.1.5
pkgrel=1
pkgdesc="A small tool to turn any entered passphrase into a strong secure password"
url="https://github.com/icaroperseo/passera"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('go')
optdepends=('xclip: X11 clipboard support'
            'xsel: Manipulate the X selection')
source=("${pkgname}::git+https://github.com/icaroperseo/passera.git")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git submodule update --init --recursive
  export GOPATH=$PWD
  go get github.com/howeyc/gopass
  go get github.com/atotto/clipboard
}

build() {
  cd "${pkgname}/src"
  patch -p2 -i gopass.patch
  go build -o passera
}

package() {
  cd "${pkgname}"

  install -Dm755 src/passera \
    "${pkgdir}/usr/bin/passera"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:
