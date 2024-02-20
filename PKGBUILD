# Maintainer: Ailton Baúque <ailtonbauque@outlook.com>

latest_tag=$(curl -s "https://api.github.com/repos/GraHms/Samora-Lang/tags" | jq -r '.[0].name')
latest_tag=${latest_tag#v}

pkgver="${latest_tag}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
pkgname=samora-lang
pkgrel=1
pkgdesc="Samora Lang - A Simple Interpreted Programming Language just for Educational Purposes."
arch=('x86_64' 'i686')
url="https://github.com/GraHms/Samora-Lang"
license=('MIT')
groups=()
depends=('go')
makedepends=('git' 'go')
checkdepends=()
optdepends=()
provides=('samora')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("git+$url")
noextract=()
md5sums=('SKIP')

#pkgver(){
#}

prepare() {
  cd "${srcdir}/Samora-Lang"
  
  go mod download
}

build() {
  cd "${srcdir}/Samora-Lang"
  
  go build -v -o samora ./
}

check() {
  cd "${srcdir}/Samora-Lang"
  
  go test -v ./
}

package() {
  cd "${srcdir}/Samora-Lang"
  
  install -Dm755 samora "${pkgdir}/opt/${pkgname}/samora"
  #install -Dm755 LICENSE "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
  install -Dm755 README.md "${pkgdir}/usr/share/docs/${pkgname}/README.md"
}

post_install() {
  ln -s "/opt/${pkgname}/samora" "/usr/bin/samora"
}

post_remove() {
  rm -f "/usr/bin/samora"
}

