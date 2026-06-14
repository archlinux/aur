# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>

pkgname=task-automation
pkgver=0.1.0
pkgrel=1
pkgdesc='KDE Plasma Wayland task recorder and player for keyboard, mouse, wheel, and timing automation'
arch=('x86_64')
url='https://github.com/yousefvand/Task-Automation'
license=('MIT')
depends=('qt6-base' 'kpackage' 'kconfig')
makedepends=('cmake')
source=("Task-Automation-${pkgver}.tar.gz::https://github.com/yousefvand/Task-Automation/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('3c50b745552675fafeac69041a880b136e8ff1016d0fcfb70646e502fd99641a')

build() {
    cmake -S "Task-Automation-${pkgver}" -B build         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr         -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 "Task-Automation-${pkgver}/LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "Task-Automation-${pkgver}/packaging/linux/taskautomation.desktop"         "${pkgdir}/usr/share/applications/taskautomation.desktop"

    install -Dm644 "Task-Automation-${pkgver}/resources/icons/taskautomation.png"         "${pkgdir}/usr/share/pixmaps/taskautomation.png"

    install -Dm644 "Task-Automation-${pkgver}/packaging/udev/70-taskautomation.rules"         "${pkgdir}/usr/lib/udev/rules.d/70-taskautomation.rules"
}
