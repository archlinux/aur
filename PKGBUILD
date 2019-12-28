# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

_pkgname="surface-dtx-daemon"
pkgname="${_pkgname}-bin"
pkgver=0.1.4
pkgrel=1
pkgdesc="Surface Detachment System (DTX) Daemon"
url="https://github.com/linux-surface/surface-dtx-daemon"
license=('MIT')
arch=('x86_64')
depends=('dbus' 'gcc-libs')
install=surface-dtx-daemon.install

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "https://github.com/linux-surface/surface-dtx-daemon/releases/download/v${pkgver}/surface-dtx-daemon-${pkgver}-${CARCH}.bin.tar.xz"
)

sha256sums=('4b446396efa03b2f749377d9ab521c67a156dec7bd2e173afc0fdb88615a4b55')

backup=(
    'etc/surface-dtx/surface-dtx-daemon.conf'
    'etc/surface-dtx/surface-dtx-userd.conf'
    'etc/surface-dtx/detach.sh'
    'etc/surface-dtx/attach.sh'
)

package() {
    # binary files
    install -D -m755 "bin/surface-dtx-daemon" "$pkgdir/usr/bin/surface-dtx-daemon"
    install -D -m755 "bin/surface-dtx-userd" "$pkgdir/usr/bin/surface-dtx-userd"

    # application files
    install -D -m644 "surface-dtx/surface-dtx-daemon.conf" "$pkgdir/etc/surface-dtx/surface-dtx-daemon.conf"
    install -D -m644 "surface-dtx/surface-dtx-userd.conf" "$pkgdir/etc/surface-dtx/surface-dtx-userd.conf"
    install -D -m755 "surface-dtx/attach.sh" "$pkgdir/etc/surface-dtx/attach.sh"
    install -D -m755 "surface-dtx/detach.sh" "$pkgdir/etc/surface-dtx/detach.sh"

    # systemd service files
    install -D -m644 "systemd/surface-dtx-daemon.service" "$pkgdir/usr/lib/systemd/system/surface-dtx-daemon.service"
    install -D -m644 "systemd/surface-dtx-userd.service" "$pkgdir/usr/lib/systemd/user/surface-dtx-userd.service"

    # dbus config file
    install -D -m644 "dbus/org.surface.dtx.conf" "$pkgdir/etc/dbus-1/system.d/org.surface.dtx.conf"

    # udev rules
    install -D -m644 "udev/40-surface_dtx.rules" "$pkgdir/etc/udev/rules.d/40-surface_dtx.rules"

    # completion files
    install -D -m644 "shell-completions/surface-dtx-daemon.bash" "$pkgdir/usr/share/bash-completion/completions/surface-dtx-daemon"
    install -D -m644 "shell-completions/surface-dtx-userd.bash" "$pkgdir/usr/share/bash-completion/completions/surface-dtx-userd"
    install -D -m644 "shell-completions/surface-dtx-daemon.zsh" "$pkgdir/usr/share/zsh/site-functions/_surface-dtx-daemon"
    install -D -m644 "shell-completions/surface-dtx-userd.zsh" "$pkgdir/usr/share/zsh/site-functions/_surface-dtx-userd"
    install -D -m644 "shell-completions/surface-dtx-daemon.fish" "$pkgdir/usr/share/fish/completions/surface-dtx-daemon.fish"
    install -D -m644 "shell-completions/surface-dtx-userd.fish" "$pkgdir/usr/share/fish/completions/surface-dtx-userd.fish"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/surface-dtx-daemon/LICENSE"
}
