pkgname=jicofo
pkgver=554
pkgrel=1
pkgdesc="JItsi Meet COnference FOcus"
arch=("x86_64")
url="https://github.com/jitsi/jicofo"
license=("Apache")
depends=("java-runtime-headless")
makedepends=("git" "unzip" "maven")
backup=("etc/jicofo/jicofo.conf")
source=($pkgname-$pkgver.tar.gz::https://github.com/jitsi/jicofo/archive/${pkgver}.tar.gz
        service config)
sha256sums=('e62e54a42046fd42ce00ada071a35b1982dded26b0e1faee779fd1d76afa913a'
            'c1e17cf1de2274d375d08afee1853e1314d74763ec600b7bba740cfb7df09258'
            'fea884f52b5c91b7514212d989fae36fd2113967c2617fae1b686ac6c774a7f8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn package -DskipTests -Dassembly.skipAssembly=false
  unzip -o target/jicofo-1.1-SNAPSHOT-archive.zip
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/${pkgname}-${pkgver}/jicofo-1.1-SNAPSHOT/" "${pkgdir}/opt/jicofo"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/jicofo.service
  install -Dm644 config "$pkgdir"/etc/jicofo/jicofo.conf
}
