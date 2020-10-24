# Maintainer: KokaKiwi <kokakiwi plus aur at kokakiwi dot org>

_pkgname=rebash
pkgname=${_pkgname}-git
pkgver=0.8.r5.g147b8f6
pkgrel=1
pkgdesc="bash/shell library/framework"
arch=('any')
url="https://github.com/jandob/rebash"
license=('WTFPL')
depends=('bash' 'sed' 'grep')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/jandob/rebash.git"
        LICENSE)
sha256sums=('SKIP'
            '9a9bda215c8393f0d53bf5ab7797608ff21879b8a57930730082a894290d8f6d')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"

  install -Dm0644 -t "${pkgdir}/usr/lib/rebash" *.sh
  chmod +x "${pkgdir}/usr/lib/rebash"/{documentation,doc_test}.sh

  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf /usr/lib/rebash/documentation.sh "${pkgdir}/usr/bin/rebash-doc"
  ln -sf /usr/lib/rebash/doc_test.sh "${pkgdir}/usr/bin/rebash-doc-test"

  install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
