# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgname=rotary-encoder-git
_gitname=rotary-encoder
pkgver=0.0.1
pkgrel=1
pkgdesc="Input device for rotary encoders connected using GPIOs."
arch=('any')
url="https://github.com/klomp/rotary-encoder"
license=('APACHE')
depends=('python2' 'python2-evdev' 'python2-raspberry-gpio')
makedepends=('python2' 'git')
conflicts=('rotary-encoder')
provides=('rotary-encoder')
source=("git+https://github.com/avanc/rotary-encoder"
        "rotary-encoder.service")
md5sums=('SKIP'
         '39733f6e13afd0d4a05209767aebc652')

package() {
  cd "$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 "$srcdir/$_gitname/config/rotencoder.cfg" "$pkgdir/etc/rotencoder.cfg"
  install -Dm644 "$srcdir/rotary-encoder.service" "$pkgdir/lib/systemd/system/rotary-encoder.service"
}

# vim:set ts=2 sw=2 et:
