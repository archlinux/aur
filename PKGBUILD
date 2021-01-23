# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="ebsynth-git"
_pkgname="ebsynth"
pkgver=r16.2f5c97c
pkgrel=1
pkgdesc="A Fast Example-based Image Synthesizer"
arch=('any')
url="https://github.com/jamriska/${_pkgname}"
license=('custom')
provides=("${_pkgname}")
makedepends=('git')
source=("${_pkgname}::git+https://github.com/jamriska/${_pkgname}"
        "LICENSE")
md5sums=('SKIP'
         '4b43b6f229b0530aca75c71986b68e19')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    ./build-linux-cpu_only.sh
}

package() {
    cd "$srcdir"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "${_pkgname}"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
 
 
