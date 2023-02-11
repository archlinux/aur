# Maintainer: Hao Long <aur@esd.cc>

pkgname=vigil-bin
pkgver=1.25.1
pkgrel=1
pkgdesc="an open-source Status Page you can host on your infrastructure, used to monitor all your servers and apps, and visible to your users"
arch=("x86_64")
url="https://github.com/valeriansaliou/vigil"
license=("MPL2")
provides=('vigil')
conflicts=('vigil')
backup=('etc/vigil.cfg')
source=('vigil.service'
        'sysusers.d'
        "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/v${pkgver}-x86_64.tar.gz")
b2sums=('3b41259b10286d3fb0374378a9cbae0a55f215b34014e9b0376850f92f675ef24a5d7b61ae166d5d9d88cec5d7dd7c2c0fad9b24f3fbd5f1a2ec9652bddf2f2b'
        '7f55d74bc16d49529e463b6c95a3e741a3aa4795918e1f3da30b3d9ca37d9312634394182563760361389d8b0af31e5aac5220193124767719ab2e5c6929abeb'
        'ec1265c9357e13dc7266cecc25dcb0579dca0c5887e5d438fd14bc78ed4f38a1d87360e37a836ca48c67b206320252d16d331b5c011c0fd44cefea69c717a8de')
install=vigil-bin.install

prepare() {
  cd vigil
  sed -i 's|path = "./res/assets/"|path = "/usr/share/vigil-bin/"|g' config.cfg
}

package() {
  install -Dm644 vigil.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 sysusers.d "${pkgdir}/usr/lib/sysusers.d/vigil.conf"
  cd vigil
  install -Dm755 vigil -t "${pkgdir}/usr/bin"
  install -Dm644 config.cfg "${pkgdir}/etc/vigil.cfg"
  mkdir -p "${pkgdir}/usr/share/"
  cp -r res/assets/ "${pkgdir}/usr/share/vigil-bin/"
}

