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
       'java-environment>=17'
       'limine'
       'snapper'
       'btrfs-progs'
       'inotify-tools'
       'dunst')
optdepends=(
        'limine-dracut-support-git: Automates kernel installation/removal and Limine boot entry management.'
        'rsync: Provides an alternative method for restoring snapshots.'
        'journalctl-desktop-notification: Sends desktop notifications for errors.'
)
makedepends=('git' 'maven')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync-git')
sha256sums=('76671e5d672d7ad747c0c59fdbf5151bd7ae58d8cd53226b785f9b6731e2c6ce')

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
