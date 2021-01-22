# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=getsploit
pkgver=0.3.0
pkgrel=1
pkgdesc="Command line utility for searching and downloading exploits"
arch=('any')
url="https://github.com/vulnersCom/getsploit"
license=('GPL')
depends=('python' 'python-urllib3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vulnersCom/getsploit/archive/${pkgver}.tar.gz")
sha256sums=('9e2cca546669632d67627f43650e148e12bde00d31455633f7c2728607a73868')

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
