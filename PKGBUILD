# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Thann/sox-noise
# Upstream: https://github.com/Thann/sox-noise

pkgname=sox-noise-git
pkgver=0.0.3.post2+g94f7ca4
pkgrel=1
pkgdesc='Noise generator GUI powered by Sound eXchange (SoX).'
arch=('any')
url='https://github.com/Thann/sox-noise'
license=('Unlicense')
depends=('python' 'python-gobject' 'sox')
makedepends=('git' 'python-setuptools' 'python-pip' 'python-wheel')
provides=('sox-noise')
conflicts=('sox-noise')
source=("$pkgname::git+https://github.com/Thann/sox-noise.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(python setup.py --version | tail -n1)"
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -f "mime.sxn.xml" ]; then
    install -D -m644 mime.sxn.xml "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  fi
}
