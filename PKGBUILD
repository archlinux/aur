# Maintainer: Takashi Inoue <inoue@pitan.org>

pkgname=chinachu-git
pkgver=r763.6145795
pkgrel=1
pkgdesc="A open source EPG digital video recorder system for Linux."
arch=('i686' 'x86_64')
url="https://github.com/kanreisa/Chinachu/"
license=('MIT')
depends=('')
makedepends=('git' 'gcc' 'make' 'yasm' 'wget')
conflicts=('chinachu')
provides=('chinachu')
install=('chinachu-git.install')
source=("$pkgname"::'git+https://github.com/kanreisa/chinachu.git'
        'chinachu-operator.service'
        'chinachu-wui.service')
sha1sums=('SKIP'
          '0956f415e780460731053695ed26c6773de93717'
          '2ae927ee97a44b7cd6c7f6f1688bb22f2a0024c7')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  yes 1 | ./chinachu installer
}

package() {
  mkdir -p "$pkgdir/var/lib/chinachu/"
  cp -rpf "$srcdir/$pkgname/"* "$pkgdir/var/lib/chinachu/"
  cp -rpf "$srcdir/$pkgname/.nave" "$pkgdir/var/lib/chinachu/"
  cp -rpf "$srcdir/$pkgname/.git" "$pkgdir/var/lib/chinachu/"
  install -Dm644 "$srcdir/chinachu-operator.service" "$pkgdir/usr/lib/systemd/system/chinachu-operator.service"
  install -Dm644 "$srcdir/chinachu-wui.service" "$pkgdir/usr/lib/systemd/system/chinachu-wui.service"
}

