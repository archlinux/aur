# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=framework-fingerprint-led-blink
pkgver=2.5
pkgrel=1
pkgdesc="Blink the Framework Laptop power-button LED while the fingerprint reader waits for a finger"
arch=('any')
url="https://github.com/alejandroqh/framework-fingerprint-led-blink"
license=('Apache-2.0')
depends=('python>=3.8' 'fprintd>=1.92' 'glib2' 'systemd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5dae4a2bba16e9738fe372a405c837d441f88eb76448f934bbac4dd886d9452b')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # upstream installs the watcher to /usr/local/sbin
  sed -i 's|/usr/local/sbin|/usr/bin|g' \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  install -Dm644 "packaging/90-${pkgname}.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/90-${pkgname}.rules"
  install -Dm644 "packaging/sysusers.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
