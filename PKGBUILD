# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

_pkgname=plotbitrate
pkgname=$_pkgname-git
pkgver=1.0.7.1.r1.g5a5665b
pkgrel=1
pkgdesc="a script for plotting the bitrate of an audio or video stream over time"
arch=('any')
url="https://github.com/zeroepoch/plotbitrate"
license=('BSD')
depends=('python-matplotlib' 'python-pyqt5' 'ffmpeg')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
  mkdir -p "$pkgdir/usr/lib/python$(python3 -V | awk -F. -v OFS=. '{print $1, $2}' | awk '{print $2}')/site-packages/"
  mv frame "$pkgdir/usr/lib/python$(python3 -V | awk -F. -v OFS=. '{print $1, $2}' | awk '{print $2}')/site-packages/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
