# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=getsploit
pkgver=0.2.2
pkgrel=1
pkgdesc="Command line utility for searching and downloading exploits"
arch=('any')
url="https://github.com/vulnersCom/getsploit"
license=('GPL')
depends=('python' 'python-urllib3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vulnersCom/getsploit/archive/${pkgver}.tar.gz")
sha256sums=('86c6b6d88abeb92f303608fd3c5d7570796e0450434e20f738dd143d9a5246be')

build() {
  cd "${pkgname}-${pkgver}"
  cat > getsploit.sh << EOF
cd /usr/share/getsploit
./getsploit.py "\${@}"
EOF
  cd ${pkgname}
  python -m compileall *
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/"
  cp -r getsploit "${pkgdir}/usr/share/"
  install -Dm 755 getsploit.sh "${pkgdir}/usr/bin/getsploit"
}
