# Maintainer: Arley Henostroza <arllk[at]gmail[dot]com>

pkgname=genie-systemd
_pkgname=genie
pkgver=1.10
pkgrel=1
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('custom:The Unlicense')
depends=('daemonize' 'dotnet-runtime' 'dotnet-host' 'hostess')
conflicts=('genie-systemd')
provides=('genie-systemd')
source=("${url}/releases/download/${pkgver}/${_pkgname}.tar.gz"
        'LICENSE')
sha256sums=('02ba197ba39d8be19afde3182ce901b67b2d1412625c0c52238b9a83d4c49401'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')

prepare() {
  tar -xzf ${_pkgname}.tar.gz
}

package() {
  cd "systemd-genie/usr/bin/"
  install -Dm 4755 -o root "genie" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "genie.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "Linux.ProcessManager.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "System.CommandLine.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "Tmds.LibC.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "genie.runtimeconfig.json" -t "$pkgdir/usr/bin"
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
