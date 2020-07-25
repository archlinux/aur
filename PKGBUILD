# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cipherscan-git
pkgver=r417.885b345
pkgrel=1
pkgdesc="A very simple way to find out which SSL ciphersuites are supported by a target"
arch=('x86_64')
url='https://github.com/mozilla/cipherscan'
license=('MPL2' 'BSD')
provides=('cipherscan')
depends=('python' 'bash')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd cipherscan
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -avR cipherscan "${pkgdir}/opt/"
  ln -s /opt/cipherscan/cipherscan "${pkgdir}/usr/bin"
  install -Dm644 cipherscan/OpenSSL-LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm cipherscan/openssl-darwin64
  install -Dm644 cipherscan/README.md -t "${pkgdir}/usr/share/doc/cipherscan"
  rm -rf "${pkgdir}/opt/cipherscan/.git"
  rm -rf "${pkgdir}/opt/cipherscan/.gitignore"
  rm -rf "${pkgdir}/opt/cipherscan/.travis.yml"
  rm -rf "${pkgdir}/opt/cipherscan/LICENSE"
  rm -rf "${pkgdir}/opt/cipherscan/OpenSSL-LICENSE"
}