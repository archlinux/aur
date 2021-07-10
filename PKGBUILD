# Maintainer: novenary <streetwalkermc@gmail.com>
pkgname=socos
pkgver=0.2.r33.g7719b54
pkgrel=1
pkgdesc="Commandline tool for controlling Sonos devices"
arch=('any')
url="https://github.com/SoCo/socos"
license=('MIT')
depends=('python' 'python-setuptools' 'python-soco')
options=(!emptydirs)
source=("git+https://github.com/SoCo/socos.git#commit=7719b54873235abc068a6bcfbf606e518baeeffc")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/socos"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/socos"
  sed -i requirements.txt -e "s/soco==0.11.1/soco>=0.11.1/"
}

package() {
  cd "$srcdir/socos"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
