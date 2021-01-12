# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='tablet-mode'
pkgver=2.1.4
pkgrel=1
pkgdesc='Tools to toggle a convertible laptop between laptop and tablet mode'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('adwaita-icon-theme' 'evtest' 'libnotify' 'python' 'python-setuptools' 'sudo' 'systemd')
makedepends=('git' 'python-setuptools-scm')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
    install -dm 755 "${pkgdir}/etc"
    install -dm 750 "${pkgdir}/etc/sudoers.d"
    install -m 640 tablet-mode.sudoers "${pkgdir}/etc/sudoers.d/tablet-mode"
    install -Dm 644 tablet-mode.service "${pkgdir}/usr/lib/systemd/system/tablet-mode.service"
    install -Dm 644 laptop-mode.service "${pkgdir}/usr/lib/systemd/system/laptop-mode.service"
    install -Dm 644 tablet-mode.group "${pkgdir}/usr/lib/sysusers.d/tablet-mode.conf"
    install -Dm 644 tablet-mode.desktop "${pkgdir}/usr/share/applications/tablet-mode.desktop"
}
