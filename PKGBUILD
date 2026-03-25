# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic), Gemini (Google), and Qwen 3.5 (Alibaba)
# Arch Linux Port of Issabel System
pkgname=issabel-system
pkgver=5.0.0
pkgrel=1
pkgdesc="Issabel System Module - Network and System Management (Arch Linux Port)"
arch=('any')
url="https://github.com/IssabelFoundation/system"
license=('GPL')
depends=('issabel-framework' 'php-legacy' 'iproute2' 'net-tools' 'postfix' 'tar' 'mariadb' 'sqlite')
install=issabel-system.install
source=()

package() {
  # Web Modules
  install -d "${pkgdir}/var/www/html/modules"
  cp -r "${startdir}/modules/"* "${pkgdir}/var/www/html/modules/"

  # Libraries and Backups
  install -d "${pkgdir}/var/www/html/libs"
  install -m644 "${startdir}/setup/paloSantoNetwork.class.php" "${pkgdir}/var/www/html/libs/"
  install -d "${pkgdir}/var/www/backup"
  install -m644 "${startdir}/setup/automatic_backup.php" "${pkgdir}/var/www/backup/"

  # Privileged and Utils
  install -d "${pkgdir}/usr/share/issabel/privileged"
  install -m755 "${startdir}/setup/usr/share/issabel/privileged/"* "${pkgdir}/usr/share/issabel/privileged/"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${startdir}/setup/usr/sbin/"* "${pkgdir}/usr/bin/"

  # Module Installer Data
  install -d "${pkgdir}/usr/share/issabel/module_installer/issabel-system-${pkgver}-${pkgrel}"
  cp -r "${startdir}/setup" "${pkgdir}/usr/share/issabel/module_installer/issabel-system-${pkgver}-${pkgrel}/"
  install -m644 "${startdir}/menu.xml" "${pkgdir}/usr/share/issabel/module_installer/issabel-system-${pkgver}-${pkgrel}/"
}
