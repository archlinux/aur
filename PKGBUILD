# Maintainer: Pieter Goetschalckx

pkgname=cage-graph
pkgver=2016.02.23
pkgrel=1
pkgdesc='The Chemical & abstract Graph environment.'
arch=(x86_64)
url=https://caagt.ugent.be/CaGe
license=(unknown)
depends=(jdk8-openjdk)
source=(
  https://github.com/CaGe-graph/CaGe/releases/download/${pkgver//./-}/CaGe.zip
  ${pkgname}.patch
  ${pkgname}.desktop
  ${pkgname}
)
sha256sums=('42dd2f67d44826849426f347d0bc8fdbac4e194881d62c9cab36bb66964c27b8'
            '95a026eb3df6b9ddacbe0869473d9f3eba163d5db7091e5c3dd25d40d6bf817e'
            'cb161b27d20728851f697851be87cea4f37e5711241a4367569ee8bfae40c0a5'
            '2abd0e5128c265421d4563466eceedc5f475b5a9ee0ae8c2e947c73f21aa3fa3')

prepare() {
  patch -p1 -i ${pkgname}.patch
}

build() {
  export CFLAGS="-fcommon"
  sh INSTALL.sh
}

package() {
  install -Dm644 cage.sh CaGe.ini java javadir .rasmolrc *.jar -t ${pkgdir}/usr/lib/cage-graph/
  cp -r Generators img Native PreCompute ${pkgdir}/usr/lib/cage-graph/

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications/
}
