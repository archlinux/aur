# Maintainer: Aleksei Gusev <aleksei.gusev@gmail.com>

pkgname=todoist-taskbar-badge-updater-git
pkgver=r15.bb8627b
pkgrel=1
pkgdesc="Updates count badge with the number of today tasks on GNOME/KDE taskbar for Todoist"
arch=('any')
url="https://github.com/hron/todoist-taskbar-badge-updater"
license=('MIT')
depends=('python' 'python-requests' 'python-dbus')
makedepends=('git')
provides=('todoist-taskbar-badge-updater')
conflicts=('todoist-taskbar-badge-updater')
install=todoist-taskbar-badge-updater-git.install
source=("${pkgname}::git+https://github.com/hron/todoist-taskbar-badge-updater.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # Get the number of revisions and latest commit hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "todoist-taskbar-badge-updater.py" "${pkgdir}/usr/bin/todoist-taskbar-badge-updater"
    install -Dm644 "todoist-taskbar-badge-updater.service" "${pkgdir}/usr/lib/systemd/user/todoist-taskbar-badge-updater.service"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
