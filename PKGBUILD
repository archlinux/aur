# Maintainer: Thaodan <theodorstormgrade@gmai.com>
_pkgname=TelegramUserMapBot
pkgname=python-${_pkgname,,}-git
pkgrel=2
pkgver=r29.e2ab1e7
pkgdesc="A Telegram Bot to collect location information from users and export the coordinates to a map service."
url="https://github.com/Thaodan/$_pkgname"
arch=('any')
license=('GPL3')
depends=('python-peewee' 'python-telegram-bot')
source=(git+https://github.com/Thaodan/$_pkgname#branch=merger)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir/$_pkgname"
  python setup.py build
}


package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm755 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
  install -dm755 "$pkgdir"/etc/$_pkgname
}
md5sums=('SKIP')
