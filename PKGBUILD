# Maintainer: karboncore

pkgname=libpam-pwdfile-git
pkgver=57.f46bd38
pkgrel=1
pkgdesc="A PAM module allowing authentication via an /etc/passwd-like file"
arch=(x86_64)
url="https://git.tiwe.de/libpam-pwdfile.git/about"
license=(GPL)
depends=(pam)
makedepends=(git)
optdepends=('whois: password generation')
provides=(${pkgname%-git})
conflicts=(libpam_pwdfile)
source=(git+https://git.tiwe.de/libpam-pwdfile.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  PAM_LIB_DIR="$pkgdir/usr/lib/security" make install
}
