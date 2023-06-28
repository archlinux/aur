# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Martynas Mickevičius <self@2m.lt>

pkgname=jabba
pkgver=0.12.2
pkgrel=1
pkgdesc="Java Version Manager."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Jabba-Team/jabba"
license=('Apache')
options=('!strip' '!emptydirs')
makedepends=('git' 'go')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::"$url/archive/${pkgver}.tar.gz")
sha256sums=('44bd276fde1eaab56dc8a32ec409ba6eee5007f3a640951b3e8908c50f032bcd')


build() {
  cd ${pkgname}-${pkgver}

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  install -D -m755 "${pkgname}-${pkgver}/jabba" "$pkgdir/usr/bin/jabba"
}

