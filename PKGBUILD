pkgname=grimaur-git
pkgver=r7.g88ebc08
pkgrel=1
pkgdesc="Lightweight AUR helper that uses the official AUR git mirror"
arch=('any')
url="https://github.com/ryk4rd/grimaur"
license=('unknown')
depends=('python' 'git')
provides=('grimaur')
conflicts=('grimaur')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/grimaur"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "${srcdir}/grimaur"
  install -Dm755 grimaur "${pkgdir}/usr/bin/grimaur"
}
