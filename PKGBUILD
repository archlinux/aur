# Maintainer: Zesko
pkgname="limine-snapper-sync-git"
pkgver=r12.8eca098
pkgrel=1
pkgdesc="Snapper integration for Limine bootloader."
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=(git+$url.git)
license=("GPL3")
depends=(
       'bash'
       'java-runtime>=17'
       'limine'
       'snapper'
       'btrfs-progs'
       'inotify-tools'
       'dunst')
optdepends=(
        'rsync: For restore'
)
makedepends=('git' 'maven')
sha1sums=("SKIP")
backup=(etc/limine-snapper-sync.conf)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/${pkgname%-git}"
    mvn clean package
    install -dm 755 usr/share/java/
    install -Dm 644 target/limine-snapper-sync*.jar usr/share/java/

}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -vr install/arch-linux/usr install/arch-linux/etc "$pkgdir"
}



