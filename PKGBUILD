# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=archlinuxcn-mirrorlist
pkgver=20210803
pkgrel=1
pkgdesc="Arch Linux CN Community repo mirrors list"
arch=("any")
url="https://github.com/archlinuxcn/mirrorlist-repo"
license=("unknown")
makedepends=(
  "python-yaml"
  "git"
)
provides=("archlinuxcn-mirrorlist-git")
conflicts=("archlinuxcn-mirrorlist-git")
backup=("etc/pacman.d/$pkgname")
source=("$pkgname::git+$url")
install="$pkgname.install"
sha256sums=("SKIP")

pkgver() {
  date +"%Y%m%d"
}

build() {
  cd "$pkgname"
  chmod +x ./update-script && ./update-script all
  sed -i "s/#Server/Server/g" archlinuxcn-mirrorlist
}

package() {
  cd "$pkgname"
  install -Dm644 archlinuxcn-mirrorlist \
    -t "$pkgdir"/etc/pacman.d
}
