# Maintainer: kpcyrd <git@rxv.cc>

pkgname=recon-ng
pkgver=4.9.3
pkgrel=1
pkgdesc='A full-featured Web Reconnaissance framework written in Python'
url='https://bitbucket.org/LaNMaSteR53/recon-ng'
license=('GPL3')
arch=('any')
depends=('python2' 'python2-dicttoxml' 'python2-dnspython'
         'python2-jsonrpclib-pelix'
         'python2-lxml' 'python2-mechanize' 'python2-slowaes'
         'python2-xlsxwriter' 'python2-olefile' 'python2-pypdf2'
         'python2-flask' 'python2-unicodecsv')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/LaNMaSteR53/recon-ng/get/v${pkgver}.tar.gz)
sha256sums=('e841bc43c5097f3506d548d23a538411f9e5712ec5dbdb2be2d3fb0a863f7faf')

prepare() {
  mv LaNMaSteR53-recon-ng-* recon-ng-$pkgver
}

package() {
  cd ${pkgname}-${pkgver}

  install -d "${pkgdir}/opt/${pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  for bin in recon-ng recon-cli recon-rpc recon-web; do
    cat > "${pkgdir}/usr/bin/$bin" << EOF
#!/bin/sh
cd /opt/recon-ng
exec python2 $bin "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/$bin"
  done

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
