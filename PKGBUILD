# Maintainer: planktonzp <ruizhipeng001@gmail.com>

pkgname=rose-pine-fcitx5-git
_pkgname=fcitx5
pkgver=r6.01c291b
pkgrel=1
pkgdesc='Soho vibes for fcitx5'
arch=('any')
url='https://github.com/rose-pine/fcitx5'
license=('MIT')
depends=('fcitx5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+https://github.com/rose-pine/fcitx5.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  for theme in rose-pine rose-pine-moon rose-pine-dawn; do
    install -dm755 "$pkgdir/usr/share/fcitx5/themes/$theme"
    install -Dm644 "$theme"/* "$pkgdir/usr/share/fcitx5/themes/$theme/"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
