# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.0.0
pkgrel=1
pkgdesc="The tool syncs Snapper snapshots with Limine bootloader"
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
license=("GPL3")
depends=(
       'bash'
       'java-environment-openjdk>=17'
       'limine'
       'snapper'
       'btrfs-progs'
       'inotify-tools'
       'dunst')
optdepends=(
        'limine-dracut-support: Automates kernel installation/removal and Limine boot entry management.'
        'rsync: Provides an alternative method for restoring snapshots.'
        'journalctl-desktop-notification: Sends desktop notifications for errors.'
)
makedepends=('git' 'maven')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync-git')
sha256sums=('44c33afed8c70b5c9af59e25fc9e3a81d3258d7572adab82b2d1607039dfefea')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mvn clean package
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  src_path="install/arch-linux/"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-snapper-sync*.jar $src_path/usr/share/java/
  cp -vr $src_path/usr $src_path/etc "$pkgdir"
}
