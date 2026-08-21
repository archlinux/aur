# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.9.2
pkgrel=1
pkgdesc="A somewhat hacky workaround for push-to-talk in Discord and other apps in Wayland."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/ptt-fix"
license=('MIT')
depends=()
makedepends=('go>=2:1.21.0')
optdepends=()
provides=()
source=("https://github.com/DeedleFake/ptt-fix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('247bfa5996389242778a626c9cad360bd8890f15bca2d611cb8a3ce966db4f1c')

build() {
  cd "$pkgname-$pkgver"
  if [[ "$(go env GOTOOLCHAIN)" == "local" ]]; then
    warning "GOTOOLCHAIN=local, which could cause the build to fail if the local version is out of date."
    warning "If the build fails, try running again with GOTOOLCHAIN=auto."
  fi
  go build -v -trimpath -o ptt-fix .
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m u=rwx,g=srx,o=rx --group input ptt-fix "$pkgdir/usr/bin/ptt-fix"
  install -Dm0644 ptt-fix.service "$pkgdir/usr/lib/systemd/user/ptt-fix.service"
}

# vim: ts=2 sw=2 et
