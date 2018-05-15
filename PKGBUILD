# Maintainer: Hokuto <abrahamhokuto@outlook.com>

pkgname=windows-longhorn-icons-git
pkgver=r2.832012f
pkgrel=1
pkgdesc="The Longhorn Icon theme for Linux (git version)"
arch=('any')
url="https://github.com/Elbullazul/Longhorn-Icon-theme"
license=('GPL')
makedepends=('git')
source=('git+https://github.com/Elbullazul/Longhorn-Icon-theme.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Longhorn-Icon-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Longhorn-Icon-theme"
  patch -p0 -i ../../index.theme.patch
}

package() {
  cd "$srcdir/Longhorn-Icon-theme"

  rm README.md
  rm LICENSE
  rm -rf .git

  install -d -m 755 "$pkgdir/usr/share/icons/Windows-Longhorn-Icons"

  find . -type f -exec \
       install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows-Longhorn-Icons/{}" \;
  
  find . -type l -exec \
       install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows-Longhorn-Icons/{}" \;
}
