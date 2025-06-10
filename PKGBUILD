# Maintainer: robertfoster
# Contributor: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.6.2 # renovate: datasource=github-tags depName=aptly-dev/aptly
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('go')
source=("https://github.com/aptly-dev/aptly/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "build/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "debian/${pkgname}-api.service" \
    -t "${pkgdir}/usr/lib/systemd/system"

  install -Dm644 completion.d/aptly \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completion.d/_aptly \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 man/aptly.1 \
    "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

sha256sums=('cadfabda2a59f397adfe6f9ce3c9ddc6fe4c6052f0e03a300ba1f22d7cf0e09a')
