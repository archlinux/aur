# Maintainer: Sébastien Luttringer

pkgname=aurbot-git
pkgver=21
pkgrel=1
pkgdesc='AUR Builder Bot'
arch=('any')
url='https://github.com/seblu/aurbot'
license=('GPL2')
makedepends=('python-distribute')
depends=('python' 'systemd')
optdepends=('devtools')
makedepends=('git')
source=('git+https://github.com/seblu/aurbot.git')
md5sums=('SKIP')
install=aurbot.install

pkgver() {
  cd aurbot
  git log --pretty=format:''|wc -l
}

package() {
  cd aurbot
  install -Dm755 aurbot "$pkgdir/usr/bin/aurbot"
  install -Dm644 aurbot.service "$pkgdir/usr/lib/systemd/system/aurbot.service"
  install -Dm644 aurbot.sysusers "$pkgdir/usr/lib/sysusers.d/aurbot.conf"
  install -Dm644 packages.conf "$pkgdir/usr/share/doc/aurbot/samples/packages.conf"
  install -dm750 "$pkgdir/var/lib/aurbot"
}

# vim:set ts=2 sw=2 et:
