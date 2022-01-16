pkgname=signal-captcha-helper-git
pkgver=r4.19347af
pkgrel=1
pkgdesc="Creates Signal captchas required for device registration"
url="https://gitlab.com/signald/captcha-helper"
#_giturl="git+https://github.com/Abraca/Abraca"
arch=('i686' 'x86_64')
depends=('gtk3' 'webkit2gtk')
makedepends=('git' 'vala')
source=('signal-captcha-helper-git::git+https://gitlab.com/signald/captcha-helper.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  valac --pkg gtk+-3.0 --pkg webkit2gtk-4.0 signal-captcha-helper.vala
}

package() {
  install -Dm755 -t ${pkgdir}/usr/bin $srcdir/$pkgname/signal-captcha-helper
}
