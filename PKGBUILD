# Maintainer: Your Name <youremail@domain.com>
pkgname=gplaycli-git
pkgver=3.29.r1.gb161dbf
pkgrel=1
pkgdesc="Google Play Downloader via Command line, based on https://codingteam.net/project/googleplaydownloader"
arch=('i686' 'x86_64')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python'
  "python-requests"
  "python-protobuf"
  "python-pyaxmlparser"
  "python-clint"
  "python-pyopenssl"
  'python-gpapi'
  'python-pycryptodome')
makedepends=('git')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
conflicts=('gplaycli')
source=("gplaycli::git+https://github.com/matlink/gplaycli.git")
md5sums=("SKIP")

pkgver() {
  cd "gplaycli"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

package() {
  cd gplaycli
  python3 setup.py install --root="$pkgdir/" --optimize=1

    # installs config to build user home - moving to /usr/share
    mkdir -p "$pkgdir/usr/share/gplaycli/"
    mv "$srcdir/gplaycli/gplaycli.conf" "$pkgdir/usr/share/gplaycli/config"
}

# vim:set ts=2 sw=2 et:
