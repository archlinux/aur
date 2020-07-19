# Maintainer: Arley Henostroza <arllk10[at]gmail[dot]com>
# Contibutor: facekapow

pkgname=genie-systemd
_pkgname=genie
pkgver=1.24
pkgrel=2
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('custom:The Unlicense')
depends=('daemonize' 'dotnet-runtime>=3.1' 'dotnet-host>=3.1' 'inetutils')
conflicts=('genie-systemd')
provides=('genie-systemd')
source=("${url}/releases/download/${pkgver}/${_pkgname}.tar.gz"
        "https://raw.githubusercontent.com/wanghaiwei/genie/master/arch/deviated-preverts.conf"
        'LICENSE')
sha256sums=('8914c4be0991c7f92eeb73e5e2ac1aed66926e524b8cda1a9a31e6d2ef102511'
            '6a79b297cead473c9b318a374b02e8e29b929d4b20225e4a859e2e4dc1ad47cd'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')

prepare() {
  tar -xzf ${_pkgname}.tar.gz
}

package() {
  install -Dm 4755 -o root "systemd-genie/usr/bin/genie" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "systemd-genie/usr/bin/genie.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/Linux.ProcessManager.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/Newtonsoft.Json.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/genie.runtimeconfig.json" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/System.CommandLine.dll" -t "$pkgdir/usr/bin"
  install -Dm 744 -o root "systemd-genie/usr/bin/Tmds.LibC.dll" -t "$pkgdir/usr/bin"
  install -Dm 644 -o root "systemd-genie/usr/bin/genie.runtimeconfig.json" -t "$pkgdir/usr/bin"

  install -Dm 755 -o root "systemd-genie/usr/lib/genie/dumpwslenv.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "systemd-genie/usr/lib/genie/readwslenv.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "systemd-genie/usr/lib/genie/runinwsl.sh" -t "$pkgdir/usr/lib/genie/"
  install -Dm 755 -o root "systemd-genie/usr/lib/systemd/system-environment-generators/10-genie-envar.sh" -t "$pkgdir/usr/lib/systemd/system-environment-generators"
  install -Dm 755 -o root "systemd-genie/usr/lib/genie/deviated-preverts.conf" -t "$pkgdir/usr/lib/genie/"
  install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm 755 -o root "$srcdir/deviated-preverts.conf" -t "$pkgdir/usr/lib/genie/"
}
