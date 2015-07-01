# Contributor: Jed Liu <jed@litech.org>
pkgname=ib-jts
pkgver=971.01
pkgrel=1
pkgdesc="Java API for electronic trading platform from discount brokerage firm Interactive Brokers"
arch=('any')
url='https://www.interactivebrokers.com/'
license=('custom')
depends=('java-environment' 'ib-tws')
makedepends=('java-environment' 'apache-ant')

source=(
  'build.xml'
  "http://interactivebrokers.github.io/downloads/twsapi_macunix.${pkgver}.jar"
)

build() {
  cd ${srcdir}/IBJts
  cp ${srcdir}/build.xml .
  ant
}

package() {
  cd ${srcdir}/IBJts
  mkdir -p ${pkgdir}/opt/ib-jts

  install -Dm644 javaclient.jar ${pkgdir}/opt/ib-jts/ibjts-${pkgver}.jar
  ln -s ibjts-${pkgver}.jar ${pkgdir}/opt/ib-jts/ibjts.jar

  cd source/JavaClient
  mkdir -p ${pkgdir}/opt/ib-jts/src
  find -type f -exec install -Dm644 {} ${pkgdir}/opt/ib-jts/src/{} \;
}

md5sums=('d6f66c3a19a8dee68d1ea6a56d1b72b8'
         '6b8ed9a34a38d7bab329f2c533d478f3')
sha1sums=('fd97a2f7089420e322aeb88ace83c855051dd03a'
          'a607eb2b813cbd839fe7064b02c87539c156502d')
sha256sums=('967b53b3ab70dd7ec0fc5a22b1fffc3f027aad957c86911352cb2215cade1af8'
            '7539b9d5e7ea7dc06fab9846bebc8bb87c5c7338430f672373a05fcdef52c248')
sha384sums=('478615b611f24ecc909ab6437ce6488d536f90f3f68d598cff8cf7607f745d9ba313be94b6ccb71be8537ddbf90e3007'
            '15e43c9d38b384126f242f221edd4abc94e8cdf7a7bdb2c71e8950c4df7b0562ff52c3eb20d42441891d5fa7efcd4d3f')
sha512sums=('9a857cfdffcb1251e6e429bd8c3eb4d316d6287dee4d7728de5c53d466b661cc15d9a2bb9495fe9c361e7ed23828395f60e635faca651f01177fd683888766f1'
            'a3187480573a44807568b9c3e51e36d29288fabdec41cff5dcc09bcdb7bfb60a730ab682cae8a1602f16883a607592cd882abe283edeea5b8f5aa13b347c8250')
