# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=librefox
pkgname=$pkgbase
pkgver=2.1
pkgrel=2
pkgdesc="Librefox: Browse With Freedom"
_ffver=64.0

arch=('x86_64')

url='https://librefox.org/'

license=('Mozilla Public License Version 2.0')

source=("https://github.com/intika/Librefox/releases/download/Librefox-v${pkgver}-v${_ffver}.0/Librefox-${pkgver}-Firefox-Linux-${_ffver}.0.zip"
        "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${_ffver}/linux-x86_64/en-US/firefox-${_ffver}.tar.bz2"
        "librefox"
        "librefox.desktop"
        )

sha1sums=('a6f36d4c55c096f7e67c7cbf500ebb0fca9a0d2a'
          'SKIP'  # Only librefox use SHA1
          'SKIP'  # Only librefox use SHA1
          'SKIP'  # Only librefox use SHA1
          )

sha256sums=('SKIP'  # librefox use SHA1
            '81a169d7541735059645b4021c3ab2332af016214d3726be58fcd376b601755f'
            '94e9dbd94fbf9668021ed580d36bb8a062ae78373e0a9aed91a261ae073696f4'
            'f65a8d33c6cd09463f97a13c9c2d3b0d75937be823f81e7c40ab0cfc91e8541e'
           )
            
validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')


package() {

  _usrshare="$pkgdir/usr/share"
  _usrlib="$pkgdir/usr/lib/librefox"
  _usrbin="$pkgdir/usr/bin/"

  mkdir -p {$_usrlib,$_usrbin,$_usrshare/applications}

  rm  "$srcdir/firefox/defaults/pref/"*
  cp -R "$srcdir/defaults/pref/"* "$srcdir/firefox/defaults/pref"

  cp -R "$srcdir/distribution" "$srcdir/firefox"

  cp $srcdir/mozilla.cfg "$srcdir/firefox"
  
  cp -R "$srcdir/firefox/"* "$_usrlib"
  
  cp librefox.desktop $_usrshare/applications/
  
  cp librefox $_usrbin
  
  chmod +x $_usrbin/librefox
}
