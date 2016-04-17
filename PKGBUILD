# Maintainer: Sébastien Luttringer

pkgname=aurbot-git
pkgver=44
pkgrel=1
pkgdesc='AUR Builder Bot'
arch=('any')
url='https://github.com/seblu/aurbot'
license=('GPL2')
backup=('etc/aurbot.conf')
makedepends=('python-distribute')
depends=('systemd' 'python' 'python-systemd')
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
  install -Dm644 /dev/null "$pkgdir/etc/aurbot.conf"

  install -dm755 "$pkgdir/usr/share/doc/aurbot/samples"
  install -m644 aurbot.conf.example{1,2,3} "$pkgdir/usr/share/doc/aurbot/samples"

  install -Dm644 aurbot.service "$pkgdir/usr/lib/systemd/system/aurbot.service"
  install -Dm644 aurbot.sysusers "$pkgdir/usr/lib/sysusers.d/aurbot.conf"
  install -Dm644 aurbot.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/aurbot.conf"
}

# vim:set ts=2 sw=2 et:
