# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-crtauth-git
pkgver=20140105
pkgrel=1
pkgdesc="A public key backed client/server authentication system"
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
url="https://github.com/spotify/crtauth"
license=('Apache')
source=(${pkgname%-git}::git+https://github.com/spotify/crtauth)
sha256sums=('SKIP')
provides=('crtauth' 'python2-crtauth')
conflicts=('crtauth' 'python2-crtauth')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
