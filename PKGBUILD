# Maintainer: Xiao-Long chen <chenxiaolong@cxl.epac.to>

pkgname=policykit-desktop-privileges-ubuntu
pkgver=0.19
pkgrel=1
pkgdesc="Policykit rules to allow administrators to Run common desktop actions without password"
arch=(any)
url="https://launchpad.net/ubuntu/+source/policykit-desktop-privileges"
license=(GPL)
depends=(polkit)
conflicts=(desktop-privileges)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-*}_${pkgver}.tar.gz")
sha512sums=('76efa1256315f8adb3cbca40bf3b29296b1b4525fc6c604a877566486e66f12792a900aed96d7a39be4fb6f2e4aca9da47cd266ffd17f8e4236c502d67af96cb')

package() {
  cd "${pkgname%-*}-${pkgver}"
  install -dm700 "${pkgdir}/etc/polkit-1/localauthority/"
  install -dm755 "${pkgdir}/etc/polkit-1/localauthority/50-local.d/"
  install -m644 com.ubuntu.desktop.pkla "${pkgdir}/etc/polkit-1/localauthority/50-local.d/"

  # Add wheel to the groups as the 'admin' and 'sudo' groups aren't present in
  # Arch Linux
  sed -i '/Identity=.*sudo/ s/$/;unix-group:wheel/g' "${pkgdir}/etc/polkit-1/localauthority/50-local.d/com.ubuntu.desktop.pkla"
}
