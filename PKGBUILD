# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='tablet-mode'
pkgver=2.1.0
pkgrel=3
pkgdesc='Tools to toggle a convertible laptop between laptop and tablet mode'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('adwaita-icon-theme' 'evtest' 'libnotify' 'python' 'sudo' 'systemd')
makedepends=('git' 'python-setuptools' 'python-setuptools-git' 'python-wheel')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
    install -dm 755 "${pkgdir}/etc"
    install -dm 750 "${pkgdir}/etc/sudoers.d"
    install -m 640 tablet-mode.sudoers "${pkgdir}/etc/sudoers.d/tablet-mode"
    install -Dm 644 tablet-mode.service "${pkgdir}/usr/lib/systemd/system/tablet-mode.service"
    install -Dm 644 laptop-mode.service "${pkgdir}/usr/lib/systemd/system/laptop-mode.service"
    install -Dm 644 tablet-mode.group "${pkgdir}/usr/lib/sysusers.d/tablet-mode.conf"
    install -Dm 644 tablet-mode.desktop "${pkgdir}/usr/share/applications/tablet-mode.desktop"
}
