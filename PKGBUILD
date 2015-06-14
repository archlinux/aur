# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgname=mopidy-tpa2016d2-git
_gitname=mopidy-tpa2016d2
pkgver=0.0.1
pkgrel=1
pkgdesc="Mopidy extension for controlling volume using an external tpa2016d2 amplifier"
arch=('any')
url="https://github.com/klomp/mopidi-tpa2016d2"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'git')
conflicts=('mopidy-tpa2016d2')
provides=('mopidy-tpa2016d2')
source=("git+https://github.com/avanc/mopidy-tpa2016d2.git"
        "i2c.rules")
md5sums=('SKIP'
         'fb0e3ffcaa8841f352d9435978ec792d')

package() {
  cd "$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/i2c.rules" "$pkgdir/etc/udev/rules.d/i2c.rules"
}

post_install() {
	getent group i2c &>/dev/null || groupadd -r i2c >/dev/null
	usermod -aG i2c mopidy
	true
}

# vim:set ts=2 sw=2 et:
