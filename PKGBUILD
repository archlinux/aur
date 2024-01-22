# Maintainer: Formed <formed at tuta dot io>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=viper4linux-git
pkgver=r18.590a936
pkgrel=1
epoch=1
pkgdesc="Implementation of the libviper library for modern Linux desktops."
arch=('x86_64')
url="https://github.com/Audio4Linux/Viper4Linux"
license=('GPL-3.0-or-later')
depends=('gst-plugin-viper4linux' 'gst-plugins-good')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'jdsp4linux')
source=("${pkgname%-git}::git+https://github.com/Audio4Linux/Viper4Linux.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 viper -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}/audio.conf" \
    "$pkgdir/usr/share/doc/${pkgname%-git}/audio.conf.example"
  install -m644 "${pkgname%-git}/"*.conf.template \
    "$pkgdir/usr/share/doc/${pkgname%-git}"
}
