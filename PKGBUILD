# Maintainer: Dadoum <contact at dadoum dot ml>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reggae
pkgver=0.9.2
pkgrel=1
pkgdesc='Build system in D, Python, Ruby, Javascript or Lua'
arch=('x86_64')
url="https://github.com/atilaneves/reggae"
license=('BSD')
depends=('gcc-libs')
makedepends=('ninja' 'dmd' 'dub' 'jq')
source=("git://github.com/atilaneves/reggae.git")
sha256sums=('SKIP')

pkgver() {
    version=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/atilaneves/reggae/tags | jq -r '.[0].name')
    printf ${version:1}
}

build() {
  cd "reggae"
  dub add unit-threaded
  ./bootstrap.sh ninja
}

package() {
  cd "reggae"
  install -Dm755 bin/reggae -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
