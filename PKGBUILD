# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=c8655b9fe30f3285095097e80b8c9312351ebd2e
pkgname=lpcli
pkgver=2018.01.29
pkgrel=1
pkgdesc='C implementation of lesspass (version 2) using libcrypto'
arch=('any')
url='https://github.com/monolifed/lpcli'
license=('Unlicense')
depends=('openssl')
optdepends=('xclip: to copy generated passwords to clipboard')
source=("https://github.com/monolifed/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('3e4339461932b08e3e7714c47554f488381f471bfab94da3175b67493ee8e870')

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  make -e USE_OSSL_DEV=1
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  # binary
  install -Dm755 lpcli \
    "${pkgdir}/usr/bin/lpcli"
  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # readme
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
