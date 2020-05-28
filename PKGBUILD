# Maintainer: Arley Henostroza <arllk10[at]gmail[dot]com>
# Contibutor: facekapow

pkgname=genie-systemd
_pkgname=genie
pkgver=1.23
pkgrel=3
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('custom:The Unlicense')
depends=('daemonize' 'dotnet-runtime>=3.0' 'dotnet-host>=3.0' 'inetutils')
conflicts=('genie-systemd')
provides=('genie-systemd')
source=("${url}/releases/download/${pkgver}/${_pkgname}.tar.gz"
        'LICENSE')
sha256sums=('fbbd633b31cbc2cc8662ee47643e6b7c8ace8a1f296c0faab59bc10b6446de64'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')

prepare() {
  tar -xzf ${_pkgname}.tar.gz
}

package() {
  install -Dm 4755 -o root "systemd-genie/usr/bin/genie" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "systemd-genie/usr/bin/genie.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/Linux.ProcessManager.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/System.CommandLine.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/Tmds.LibC.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "systemd-genie/usr/bin/genie.runtimeconfig.json" -t "$pkgdir/usr/bin"
  install -Dm 755 -o root "systemd-genie/lib/genie/dumpwslenv.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "systemd-genie/lib/genie/readwslenv.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "systemd-genie/lib/genie/runinwsl.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "systemd-genie/lib/systemd/system-environment-generators/10-genie-envar.sh" -t "$pkgdir/usr/lib/systemd/system-environment-generators"
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
