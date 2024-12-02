# Maintainer: Zesko
_pkgname="limine-entry-tool"
pkgname="limine-dracut-support"
pkgver=1.3.0
pkgrel=1
pkgdesc="Install kernel for Limine bootloader."
arch=("any")
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
license=("GPL3")
depends=(
       'bash'
       'java-environment-openjdk>=17'
       'limine'
       'dracut'
       'systemd'
       'efibootmgr')
optdepends=(
        'journalctl-desktop-notification: It notifies you on Desktop when an error occurs.'
)
makedepends=('git' 'maven')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-dracut-support-git')


build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    mvn clean package
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  src_path="install/arch-linux/${pkgname}"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-entry-tool*.jar $src_path/usr/share/java/
  cp -vr $src_path/usr $src_path/etc "$pkgdir"
}
sha256sums=('0af511b23e8f44536b0cce6a4962092531db7832c8972825485581ff5aa24fce')
