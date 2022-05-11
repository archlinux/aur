pkgname=website-stalker-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('LGPL2.1')
depends=('gcc-libs' 'zlib')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('39e09f3b200a3409337bda667828933625e80a599d800e2035f35b526ee7dcd7')
sha256sums_aarch64=('313206b6afea683b8e95626e2a44c752634f654d241d1a9e2ca0984ab8415c7c')
sha256sums_armv6h=('bc3af84f0098e41537b3fd6e158414da7dcebf28a8343f74a2d141d1d2aebdb7')
sha256sums_armv7h=('5f503e8e359ef896cb0747c9d79e47415a4a8dd23c6a0e62a0dfb8667a5fb199')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-bin/}/LICENSE"
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  install -Dm644 "completions/${pkgname/-bin/}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname/-bin/}.bash"
  install -Dm644 "completions/${pkgname/-bin/}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname/-bin/}.fish"
  install -Dm644 "completions/_${pkgname/-bin/}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname/-bin/}"

  install -Dm644 "systemd/system/service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.service"
  install -Dm644 "systemd/system/timer" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.timer"
  install -Dm644 "systemd/system/sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname/-bin/}.conf"
  install -Dm644 "systemd/system/tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname/-bin/}.conf"

  install -Dm644 "systemd/user/service" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.service"
  install -Dm644 "systemd/user/timer" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.timer"
}

check() {
  eval "./website-stalker --help"
}
