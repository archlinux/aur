# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=bpfps-git
pkgver=0.1.5+1.gebc9b42
pkgrel=1
pkgdesc="Tool to list and diagnose bpf programs.  (Who watches the watchers..? :)"
arch=('i686' 'x86_64')
url="https://github.com/genuinetools/bpfps"
license=('MIT')
makedepends=('go')
conflicts=('bpfps-bin')

prepare() {
  export GOPATH="${srcdir}"
  go get github.com/genuinetools/bpfps
}

pkgver() {
  cd "${srcdir}/src/github.com/genuinetools/bpfps"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/+/; s/-/\./'
}

package() {
  install -Dm755 "${srcdir}/bin/bpfps" "${pkgdir}/usr/bin/bpfps"
}
