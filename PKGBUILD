# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=subdomainizer
pkgver=2.0
pkgrel=2
pkgdesc="A tool to find subdomains and interesting things hidden inside, external Javascript files of page, folder, and Github."
arch=(any)
url="https://github.com/nsonaniya2010/SubDomainizer"
license=(MIT)
depends=(python-termcolor python-beautifulsoup4 python-requests python-htmlmin python-tldextract python-colorama python-cffi)
source=($pkgname-$pkgver.tar.gz::https://github.com/nsonaniya2010/SubDomainizer/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4c0b4745d54b6797eeb5f79851bd34334187763d71459a27736904753db75d0c')

build() {
  cd SubDomainizer-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd SubDomainizer-${pkgver}
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -a --no-preserve=ownership * "${pkgdir}/opt/${pkgname}"
  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
cd /opt/${pkgname}
python SubDomainizer.py "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
