# Maintainer: Roger Duran <rogerduran@gmail.com>
pkgname=twister-html-git
pkgver=29.ddf4578
pkgrel=2
pkgdesc="Twister html User Interface"
arch=(any)
url="http://twister.net.co/"
license=('MIT' 'BSD')
groups=()
depends=('twister-core-git')
makedepends=('git')
source=("git://github.com/miguelfreitas/twister-html.git" "twister.service" "twister.tmpfiles")
install="$pkgname.install"
md5sums=('SKIP'
         '256ba30fe99fbf5d5070e6fa196e1d10'
         '2a8702ee09350f66944dfb61779b4584')

_gitname=twister-html

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/var/lib/twister/data/html"
  cp -r $srcdir/$_gitname/* "$pkgdir/var/lib/twister/data/html/"
  chown 66:66 -R "$pkgdir/var/lib/twister/data/"
  chmod 744 -R "$pkgdir/var/lib/twister/data/"

  install -D -m644 "${srcdir}/twister.service" "${pkgdir}/usr/lib/systemd/system/twister.service"
  install -D -m644 "${srcdir}/twister.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/twister.conf"
}

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


# vim:set ts=2 sw=2 et:
