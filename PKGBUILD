# Maintainer: Arley Henostroza <arllk10[at]gmail[dot]com>
# Contibutor: facekapow

pkgname=genie-systemd
_pkgname=genie
pkgver=1.27
pkgrel=1
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('custom:The Unlicense')
depends=('daemonize' 'dotnet-runtime>=3.1' 'dotnet-host>=3.1' 'inetutils')
makedepends=('dotnet-sdk>=3.1')
conflicts=('genie-systemd')
provides=('genie-systemd')
source=("${url}/archive/${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('662b363c08605821b8eb5970598df0df55cf1bf3f20673b953bd52a60880c09c'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')

prepare() {
  tar -xzf ${pkgver}.tar.gz
}

package() {
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  ls -alh
  cd genie-${pkgver}/genie
  export DESTDIR=$pkgdir
  make build
  make install
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p ${pkgdir}/usr/bin
  chmod +x ${pkgdir}/usr/libexec/genie
  ln -s /usr/libexec/genie/main/genie ${pkgdir}/usr/bin/genie
}
