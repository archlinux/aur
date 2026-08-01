# Maintainer: EduHoff <ehcs.business@proton.me>
pkgname=linuxtask-aur
pkgver=r5229a74
pkgrel=1
pkgdesc="Minimalist macro recorder for Linux, optimized for Hyprland (Wayland) - Custom Fix"
arch=('any')
url="https://github.com/JADRT22/LinuxTask"
license=('MIT')
depends=('python' 'python-evdev' 'python-customtkinter' 'xdotool')
makedepends=('git')
provides=('linuxtask')
conflicts=('linuxtask')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/LinuxTask"
  git describe --long --tags | sed 's/\([^-]*-\)*g/r/;s/-/./g'
}

package() {
  cd "${srcdir}/LinuxTask"

  install -d "${pkgdir}/opt/LinuxTask"
  install -d "${pkgdir}/usr/share/applications"

  cp -r assets src tools "${pkgdir}/opt/LinuxTask/"
  chmod +x "${pkgdir}/opt/LinuxTask/tools/run.sh"

  cat <<EOF > "${pkgdir}/usr/share/applications/linuxtask.desktop"
[Desktop Entry]
Name=LinuxTask
Comment=Minimalist macro recorder for Hyprland
Exec=/opt/LinuxTask/tools/run.sh
Path=/opt/LinuxTask/
Icon=/opt/LinuxTask/assets/icon.png
Terminal=false
Type=Application
Categories=Utility;Automation;
StartupNotify=true
EOF
}
