# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Thann/play-with-mpv
# Upstream: https://github.com/Thann/play-with-mpv

pkgname=play-with-mpv-git
pkgver=0.1.0.post9+g07a9c1d
pkgrel=1
pkgdesc='Chrome extension and python server that allows you to play videos in webpages with MPV instead.'
arch=('any')
url='https://github.com/Thann/play-with-mpv'
license=('Unlicense')
depends=('python' 'python-wheel' 'python-pip' 'youtube-dl' 'mpv')
optdepends=('peerflix' 'mkchromecast')
makedepends=('git' 'python-setuptools')
provides=('play-with-mpv')
conflicts=('play-with-mpv')
source=("$pkgname::git+https://github.com/Thann/play-with-mpv.git" "play-with-mpv.service")
sha256sums=('SKIP' 'b273cd8ac9c48e04ac3c7fbcdd5657ed7eefa384212060341c138fd39d44c0d9')

pkgver() {
  cd $pkgname
  echo "$(python setup.py --version | tail -n1)"
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  #install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 ../play-with-mpv.service "$pkgdir/usr/lib/systemd/user/play-with-mpv.service"
}
