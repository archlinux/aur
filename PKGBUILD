# Maintainer: crystaly <crystaly [ at ] posteo [ dot ] de>
pkgname=python2-pyspotify-connect
_pkgname=pyspotify-connect
pkgver=0.1.10_alpha_rev2
pkgrel=1
pkgdesc="A Spotify Connect python wrapper"
arch=('armv7h' 'armv6h')
url='https://pypi.python.org/pypi/pyspotify-connect'
license=('Apache')
depends=('python2')
options=(!emptydirs)
source=("git+https://github.com/chukysoria/pyspotify-connect.git#tag=v${pkgver//_/-}")
source_armv7h=('https://github.com/sashahilton00/spotify-connect-resources/raw/master/libs/armhf/armv7/release-esdk-1.20.0-v1.20.0-g594175d4/libspotify_embedded_shared.so')
source_armv6h=('https://github.com/sashahilton00/spotify-connect-resources/raw/master/libs/armel/armv6/release-esdk-1.18.0-v1.18.0-g121b4b2b/libspotify_embedded_shared.so')
md5sums=('SKIP')
md5sums_armv7h=('8eb692f37f33ce388c04f2e28419ea06')
md5sums_armv6h=('c662aaff71001aa658a9dba64e085059')

pkgver() {
  cd "$srcdir/$_pkgname"  
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/_/g'
}

package() {
  cd "$srcdir/$_pkgname"

  # copy libspotify.so to /usr/lib
  install -D -m644 "$srcdir/libspotify_embedded_shared.so" "${pkgdir}/usr/lib/libspotify_embedded_shared.so"

  if [ -z "$LIBRARY_PATH" ] ; then
    export LIBRARY_PATH="$srcdir"
  else
    export LIBRARY_PATH="${LIBRARY_PATH}:$srcdir"
  fi
  
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

