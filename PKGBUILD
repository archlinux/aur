# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname='git-brws'
pkgver=0.11.12
pkgrel=1
pkgdesc="CLI tool to open repository, file, commit, diff, tag, pull request, blame, issue or project's website"
arch=('x86_64')
url='https://rhysd.github.io/git-brws/'
_url_source='https://github.com/rhysd/git-brws'
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${_url_source}/archive/v${pkgver}.tar.gz")
sha256sums=('3a4bbf93f0b16562260ca66c2b60c655d5bfc690d0229d11757be76d95cb81c5')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build \
    --all-features \
    --locked \
    --release \
    --target-dir='target'
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
