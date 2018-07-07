# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=anontwi
pkgver=1.1b
pkgrel=1
pkgdesc="A free software python client designed to navigate anonymously on social networks. It supports Identi.ca and Twitter.com."
arch=('any')
url="https://anontwi.03c8.net/"
license=("BSD")
depends=("python2" "python2-crypto" "python2-httplib2" "python2-pycurl" "gtk2" "pygtk")
source=("${pkgname}-${pkgver}.tar.gz"::"https://${pkgname}.03c8.net/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('ab406e981859523a56cfc3b121585a551dfdd3265ba2a830beecfa2f97ccea1f')

package() {
  cd "$srcdir/AnonTwi"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md docs/AUTHOR \
    docs/INSTALL docs/THANKS
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -rf docs

  cp -a . "$pkgdir/usr/share/${pkgname}"

  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
cd /usr/share/${pkgname}
exec python2 ${pkgname} "\$@"
EOF

  chmod +755 "${pkgdir}/usr/bin/${pkgname}"
}
