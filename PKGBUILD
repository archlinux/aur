# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-git
_gitname=mopidy
pkgver=0.19.4.r249.g84897dd
pkgrel=2
pkgdesc="A music server which can play music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('python2'
         'python2-pykka'
         'python2-setuptools'
         'python2-tornado'
         'gstreamer0.10-python'
         'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins'
         'gstreamer0.10-ugly-plugins')
makedepends=('git')
optdepends=('gstreamer0.10-ffmpeg: AAC+ and WMA support.'
            'mopidy-spotify: Spotify backend'
            'mopidy-scrobbler: Last.FM scrobbler'
            'mopidy-MPRIS: MPRIS frontend')
conflicts=('mopidy')
provides=("mopidy=$pkgver-$pkgrel")
source=('git+https://github.com/mopidy/mopidy.git'
        'mopidy@.service'
        'mopidy-user.service')
md5sums=('SKIP'
         'cdda1474b91b1e35a909e93fc8305599'
         '81de34714bf80d638df34fc3469bd3f5')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -Dm644 "$srcdir/mopidy@.service" "$pkgdir/usr/lib/systemd/system/mopidy@.service"
  install -Dm644 "$srcdir/mopidy-user.service" "$pkgdir/usr/lib/systemd/user/mopidy.service"
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
