# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ricardo Honorato <rikardo.horo@gmail.com>

pkgname=taverna
pkgver=2.5.0
_signature=ZRureiBbIGh%2BjlCfZq%2F1%2BIPUDfc%3D
_expires=1409410695
_accesskey=0EMWEFSGA12Z1HF1TZ82
pkgrel=1
pkgdesc='A tool for designing and executing workflows'
arch=('any')
url=('http://www.taverna.org.uk/')
license=('LGPL')
depends=('java-runtime' 'graphviz')
optdepends=('r')
source=($pkgname-$pkgver.zip::"https://bbuseruploads.s3.amazonaws.com/taverna/taverna-workbench-product/downloads/taverna-workbench-enterprise-$pkgver-standalone.zip?Signature=$_signature&Expires=$_expires&AWSAccessKeyId=$_accesskey")
noextract=("taverna-$pkgver.zip")
md5sums=('504052ff387346097f02f9877da99b28')

package() {
    mkdir -p "$pkgdir/"{opt,usr/bin}
    unzip taverna-$pkgver.zip -d "$pkgdir"
    mv "$pkgdir"/taverna-workbench-enterprise-$pkgver "$pkgdir"/opt/taverna

    find "$pkgdir" -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -exec chmod 644 {} +

    chmod a+x "$pkgdir"/opt/taverna/*.sh
    rm -f "$pkgdir"/opt/taverna.{exe,bat}
    sed -i "s:\$taverna_home/bin/dot.sh:dot:" "$pkgdir"/opt/taverna/taverna.sh

    ln -s /opt/taverna/taverna.sh "$pkgdir/usr/bin/taverna"
    ln -s /opt/taverna/executeworkflow.sh "$pkgdir/usr/bin/executeworkflow"
}
