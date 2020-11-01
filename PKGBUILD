# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=tp-auto-kbbl
pkgver=0.1.5
pkgrel=1
pkgdesc="Auto toggle keyboard back-lighting on Thinkpads (and maybe other laptops) for Linux"
arch=('x86_64')
url="https://github.com/saibotd/tp-auto-kbbl"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc' 'libevdev')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.conf.d")
backup=("etc/conf.d/${pkgname}")
sha256sums=('8fd9f7f89a07057878c42269cbccd34dd51883001d18eae4a6599778d6fc9e57'
            'b41d5d2c4739b891fbdf781e69dda4135c8ee93fd59728b3bde64175eef252de'
            '8361883b7e0d6513f709dbdef678d818502d58e720aae97e21bc87484059473b')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
