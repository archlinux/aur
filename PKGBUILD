pkgname='quicktun'
pkgdesc='Simple and secure VPN software'
pkgver='2.2.5'
pkgrel='1'
arch=('i686' 'x86_64' 'arm')
depends=('libsodium')
url='http://wiki.qontrol.nl/QuickTun'
license=('custom')
source=("http://oss.ucis.nl/quicktun/src/${pkgname}-${pkgver}.tgz"
        'build.patch')
sha512sums=('1dacba92be6d8790cc6d0e0790f93dd0d047f06e366fbd21ef46478851c4d8c89412effd827e65bacab225d015e85938ddd6d617d8b84e80ac8adf33d94d8a94'
            '27854236255a20e45b8e3ec41e9f2b8fc3cac6eac1f010878c6df85197ad63238b9b6c506b8c0e7abe842760e377fc54722d31e86ead7a5ab19333f102981247')

prepare () {
  cd "${pkgname}-${pkgver}"
  sed -e '1,/\*\//p' -e d src/keypair.c > COPYING
  patch -p0 < "${srcdir}/build.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./build.sh
}

package () {
  cd "${pkgname}-${pkgver}"
  install -Dm755 out/quicktun.combined "${pkgdir}/usr/bin/quicktun"
  install -Dm755 out/quicktun.keypair "${pkgdir}/usr/bin/quicktun.keypair"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
