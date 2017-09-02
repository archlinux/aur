_pkgbase='suru-icon-theme'
_git='snwh'
pkgname="$_pkgbase-git"
arch=('any')
pkgver=r33.8672ace
pkgrel=2
source=("git+https://github.com/$_git/$_pkgbase.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgbase
  find Suru/[1-9]* Suru/scalable Suru/index.theme -exec \
  install -D -m 644 '{}' "$pkgdir"/usr/share/icons/'{}' \;
}

post-install() {
  gtk-update-icon-cache /usr/share/icons/Suru
}
