# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Nathan Owe. <ndowens04 at gmail>

pkgname=newsfeed
pkgver=3.7
pkgrel=1
pkgdesc="An RSS/RDF/Atom reader and aggregator"
arch=('any')
url="http://mdoege.github.io/3NewsFeed/"
license=('GPL')
depends=('python' 'tk' 'python-feedparser')
optdepends=('python-pillow: for displaying images in feeds'
            'python-pyaudio: for audio notifications'
            'snack: for audio notifications (legacy)')
source=("http://mdoege.github.io/3NewsFeed/NewsFeed-$pkgver.tar.gz"
        "newsfeed.desktop"
        "newsfeed.png")
md5sums=('4a562089e0318270cb60e7c6d388a1b8'
         'bf9de50dadb523f9dd4599eb1d852bf5'
         '934bc285373e953a21cbf1a4b17888ca')

build() {
  cd "$srcdir/NewsFeed-$pkgver"
  sed -i 's/"feedparser",//g' setup.py
  rm feedparser.py
  python setup.py build
}

package() {
  cd "$srcdir/NewsFeed-$pkgver"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --install-data=/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/icons
  cp $srcdir/../newsfeed.png $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/../newsfeed.desktop $pkgdir/usr/share/applications
}
