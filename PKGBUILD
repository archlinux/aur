# Maintainer: edwloef

pkgname=flow-control-nightly-bin
_pkgname=flow-control
__pkgname=flow
pkgver=ge704b3ce
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$__pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('curl' 'jq' 'tar' 'sed')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=()
sha256sums=()

pkgver() {
    curl -s https://api.github.com/repos/neurocyte/flow-nightly/releases/latest | jq '.tag_name' | sed 's/".*-\(.*\)"/\1/'
}

build() {
    curl -Lo ${pkgname}.tar.gz $(curl -s https://api.github.com/repos/neurocyte/flow-nightly/releases/latest | jq -r '.assets[] | select(.name | test("^flow-v.*-linux-x86\\.tar\\.gz$")) | .browser_download_url')
    tar -xf ${pkgname}.tar.gz
}

package() {
    install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
}
