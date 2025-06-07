# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>
# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=terminal-parrot
pkgver=1.2.1
pkgrel=1
conflicts=('terminal-parrot-git')
pkgdesc="Party parrot (http://cultofthepartyparrot.com) for your terminal"
arch=('x86_64')
url="https://github.com/jmhobbs/terminal-parrot"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/jmhobbs/terminal-parrot/archive/${pkgver}.tar.gz")
sha256sums=('bfa921f6263627488ae498e60bf7f8cbb22054956336f5339319f0ff83a275b6')

prepare() {
    cd "${pkgname}-${pkgver}"
    go mod download
}

build() {
  #export GOPATH="${srcdir}/go"
  cd "${pkgname}-${pkgver}"

  go build \
  -trimpath \
  -buildmode=pie \
  -mod=readonly \
  -modcacherw \
  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
  -o ${pkgname} \
  .

}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
