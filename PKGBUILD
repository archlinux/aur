# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13-tablet-kit
pkgver=1.0.1
pkgrel=1
pkgdesc='Posture-aware tablet mode for the ASUS ROG Flow Z13 (GZ302) on KDE Plasma 6 / Wayland'
arch=('any')
url='https://github.com/aic0d3r/z13-tablet-kit'
license=('Apache-2.0')
depends=('python' 'python-evdev' 'qt6-tools' 'glib2' 'libkscreen' 'z13ctl-plus-bin')
optdepends=('plasma-keyboard: on-screen keyboard in tablet posture'
            'maliit-keyboard: alternative on-screen keyboard'
            'iio-sensor-proxy: Plasma auto-rotate'
            'z13gui-plus-bin: posture/health overlay and tablet settings')
install=z13-tablet-kit.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aic0d3r/z13-tablet-kit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('435adae731272ba7a146313c63221e4b5b57ebab3365c1e6b1d89a3d2be34151')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 bin/dock bin/z13-tablet-switch bin/z13-touch-scroll -t "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 systemd/*.service -t "${pkgdir}/usr/lib/systemd/user/"
    sed -i "s#%h/.local/bin/#/usr/lib/${pkgname}/#" "${pkgdir}"/usr/lib/systemd/user/*.service
    install -Dm644 udev/*.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
