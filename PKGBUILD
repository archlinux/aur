# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jicofo-git
pkgver=r1.938738f
pkgrel=2
epoch=
pkgdesc="JItsi Meet COnference FOcus"
arch=("x86_64")
url="https://github.com/jitsi/jicofo"
license=("Apache")
groups=()
depends=("java-runtime-headless" "maven" "unzip")
makedepends=("git")
checkdepends=()
optdepends=()
provides=("jicofo")
conflicts=("jicofo")
replaces=()
backup=("etc/jicofo/jicofo.conf")
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jicofo
        service
        config)
noextract=()
sha256sums=("SKIP"
            "c1e17cf1de2274d375d08afee1853e1314d74763ec600b7bba740cfb7df09258"
            "fea884f52b5c91b7514212d989fae36fd2113967c2617fae1b686ac6c774a7f8")
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}"
  mvn package -DskipTests -Dassembly.skipAssembly=false
  unzip -o target/jicofo-1.1-SNAPSHOT-archive.zip
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/jicofo-git/jicofo-1.1-SNAPSHOT/" "${pkgdir}/opt/jicofo"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/jicofo.service
  install -Dm644 config "$pkgdir"/etc/jicofo/jicofo.conf
}
