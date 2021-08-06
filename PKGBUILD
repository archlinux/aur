# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Thann/play-with-mpv
# Upstream: https://github.com/Thann/play-with-mpv

pkgname=play-with-mpv-git
pkgver=0.1.0.post9+g07a9c1d
pkgrel=1
pkgdesc='Chrome extension and python server that allows you to play videos in webpages with MPV instead.'
arch=('any')
url='https://github.com/Thann/play-with-mpv'
license=('MIT')
depends=('python' 'python-wheel' 'python-pip' 'youtube-dl' 'mpv')
optdepends=('peerflix' 'mkchromecast')
makedepends=('git' 'python-setuptools')
provides=('play-with-mpv')
conflicts=('play-with-mpv')
source=("$pkgname::git+https://github.com/Thann/play-with-mpv.git" "play-with-mpv.service")
sha256sums=('SKIP' '3015d2a2d1c3274096879360ed2f521efc1b233c48fe1a8c836924736d378f50')

pkgver() {
  cd $pkgname
  echo "$(python setup.py --version | tail -n1)"
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 ../play-with-mpv.service "$pkgdir/usr/lib/systemd/user/play-with-mpv.service"
}
