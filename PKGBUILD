# Maintainer: kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=spotify_dl
_reponame=spotify-dl
pkgver=v3.r2.gb9d82fb
pkgrel=1
epoch=
pkgdesc="Downloads songs from your Spotify Playlist"
arch=('any')
url="https://github.com/SathyaBhat/spotify-dl"
license=('MIT')
depends=('python-spotipy' 'python-google-api-python-client' 'youtube-dl')
source=("git+https://github.com/SathyaBhat/spotify-dl/")
md5sums=('SKIP')

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_reponame"
  sed 's/^google-api-python-client==1.6.2$/google-api-python-client>=1.6.2/' -i requirements.txt
  sed 's/^spotipy==2.3.8$/spotipy>=2.3.8/' -i requirements.txt
  }

build() {
  cd "$srcdir/$_reponame"

  python ./setup.py build
}

package() {
  cd "$srcdir/$_reponame"

  python ./setup.py install --root="$pkgdir"

  install -D LICENSE "$pkgdir"/usr/share/licenses/"$_reponame"/LICENSE
}

# vim:set ts=2 sw=2 et:
