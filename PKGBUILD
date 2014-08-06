# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-git
_gitname=mopidy
pkgver=0.19.3.r57.g4c60c6b
pkgrel=1
pkgdesc="A music server which can play music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('python2'
         'python2-pykka'
         'python2-setuptools'
         'gstreamer0.10-python'
         'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins'
         'gstreamer0.10-ugly-plugins')
makedepends=('git' 'python2')
optdepends=('gstreamer0.10-ffmpeg: AAC+ and WMA support.'
            'mopidy-spotify: Spotify backend'
            'mopidy-scrobbler: Last.FM scrobbler'
            'mopidy-MPRIS: MPRIS frontend'
            'python2-tornado: HTTP frontend')
conflicts=('mopidy')
provides=('mopidy')
source=('git+https://github.com/mopidy/mopidy.git'
        'mopidy@.service')
md5sums=('SKIP'
         'eee7b58b4eb5ca7de27f67e174ab7f9a')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -Dm644 "$srcdir/mopidy@.service" "$pkgdir/usr/lib/systemd/system/mopidy@.service"
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
